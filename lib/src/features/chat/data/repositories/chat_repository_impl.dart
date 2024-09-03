import 'package:hnk_ask_ai/src/core/enums/message_sender.dart';
import 'package:hnk_ask_ai/src/core/extensions/xfile_extention.dart';
import 'package:hnk_ask_ai/src/features/chat/data/repositories/chat_repository.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<MessageModel> createMessage({
    XFile? image,
    required String content,
  }) async {
    MessageModel message = MessageModel(
      id: const Uuid().v4(),
      content: content,
      createdAt: DateTime.now(),
      sender: MessageSender.user,
    );
    if (image != null) {
      message = message.copyWith(
        imageUrl: image.path,
      );
    }
    return message;
  }

  @override
  Future<GenerateContentResponse> generateResponse({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  }) async {
    if (image == null) {
      return await geminiModel.generateContent([Content.text(content)]);
    } else {
      final imageBytes = await image.readAsBytes();
      final prompt = TextPart(content);
      final mimeType = image.getTypeImage();
      final imagePart = DataPart(mimeType, imageBytes);
      return await geminiModel.generateContent([
        Content.multi([
          prompt,
          imagePart,
        ])
      ]);
    }
  }
}
