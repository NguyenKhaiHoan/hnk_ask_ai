import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/failure.dart';
import '../../application/chat_service.dart';
import '../../domain/message_model.dart';
import '../states/list_message_state.dart';

class ListMessageController extends Cubit<ListMessageState> {
  final ChatService chatService;
  StreamSubscription<List<MessageModel>?>? _messagesSubscription;

  ListMessageController(this.chatService)
      : super(const ListMessageState.loading());

  void subscribeToMessages({required String userId}) {
    emit(const ListMessageState.loading());
    _messagesSubscription = chatService.getMessages(userId: userId).listen(
      (messages) {
        emit(ListMessageState.data(messages: messages));
      },
      onError: (error) {
        emit(ListMessageState.error(
            failure: Failure(message: error.toString())));
      },
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
