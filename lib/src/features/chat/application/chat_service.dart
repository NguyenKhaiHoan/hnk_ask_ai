import 'package:hnk_ask_ai/src/core/enums/message_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../data/repositories/chat_repository.dart';
import '../data/repositories/firebase_chat_repository.dart';
import '../domain/message_model.dart';

class ChatService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseChatRepository _firebaseChatRepository;
  final ChatRepository _chatRepository;

  ChatService({
    required FirebaseChatRepository firebaseChatRepository,
    required ChatRepository chatRepository,
  })  : _firebaseChatRepository = firebaseChatRepository,
        _chatRepository = chatRepository;

  Future<void> sendMessage({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  }) async {
    try {
      final userId = _firebaseAuth.currentUser!.uid;
      MessageModel sentMessage = await _chatRepository.createMessage(
        image: image,
        content: content,
      );
      if (image != null) {
        final downloadUrl = await _firebaseChatRepository.pushImageToStorage(
          image: image,
          messageId: sentMessage.id,
        );
        sentMessage = sentMessage.copyWith(
          imageUrl: downloadUrl,
        );
      }
      final response = await _chatRepository.generateResponse(
        image: image,
        geminiModel: geminiModel,
        content: content,
      );

      await _firebaseChatRepository.saveMessageToFirestore(userId, sentMessage);

      final responsedMessage = MessageModel(
        id: const Uuid().v4(),
        content: response.text ?? '',
        createdAt: DateTime.now(),
        sender: MessageSender.askAi,
      );

      await _firebaseChatRepository.saveMessageToFirestore(
          userId, responsedMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
