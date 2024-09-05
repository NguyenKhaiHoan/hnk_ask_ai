import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hnk_ask_ai/src/core/enums/message_sender.dart';
import 'package:hnk_ask_ai/src/core/exceptions/failure.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../data/repositories/chat_repository.dart';
import '../data/repositories/firebase_chat_repository.dart';
import '../domain/message_model.dart';

class ChatService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseChatRepository _firebaseChatRepository;
  final ChatRepository _chatRepository;

  ChatService({
    required FirebaseChatRepository firebaseChatRepository,
    required ChatRepository chatRepository,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseChatRepository = firebaseChatRepository,
        _chatRepository = chatRepository,
        _firebaseAuth = firebaseAuth;

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

      await _firebaseChatRepository.saveMessageToFirestore(
          userId: userId, message: sentMessage);

      final responsedMessage = MessageModel(
        id: const Uuid().v4(),
        content: response.text ?? '',
        createdAt: DateTime.now(),
        sender: MessageSender.askAi,
      );

      await _firebaseChatRepository.saveMessageToFirestore(
          userId: userId, message: responsedMessage);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Stream<List<MessageModel>?> getMessages({required String userId}) {
    return _firebaseChatRepository.getMessages(userId: userId);
  }

  Future<XFile?> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(
        maxWidth: 1280,
        maxHeight: 1280,
        imageQuality: 80,
        source: ImageSource.gallery,
        requestFullMetadata: true,
      );

      return pickedImage;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
