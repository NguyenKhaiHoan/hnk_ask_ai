import 'package:hnk_ask_ai/src/features/chat/domain/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class ChatRepository {
  Future<MessageModel> createMessage({
    XFile? image,
    required String content,
  });

  Future<GenerateContentResponse> generateResponse({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  });
}
