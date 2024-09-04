import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/injection.dart';
import '../../domain/message_model.dart';

part 'chat_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<List<MessageModel>?> messagesStateChanges(MessagesStateChangesRef ref,
    {required String userId}) {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.getMessages(userId: userId);
}
