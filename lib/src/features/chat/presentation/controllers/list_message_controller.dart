import 'package:get/get.dart';
import 'package:hnk_ask_ai/src/features/chat/application/chat_service.dart';

import '../../domain/message_model.dart';

class ListMessageController extends GetxController {
  final chatService = Get.find<ChatService>();

  Stream<List<MessageModel>?> messagesStateChanges({required String userId}) {
    return chatService.getMessages(userId: userId);
  }
}
