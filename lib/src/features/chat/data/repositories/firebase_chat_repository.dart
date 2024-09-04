import 'package:hnk_ask_ai/src/features/chat/domain/message_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class FirebaseChatRepository {
  Future<String> pushImageToStorage({
    required XFile image,
    required String messageId,
  });

  Future<void> saveMessageToFirestore(
      {required String userId, required MessageModel message});
}
