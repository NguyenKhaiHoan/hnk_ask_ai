import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/ai_model.dart';
import '../states/chat_screen_state.dart';

class ChatScreenController extends Cubit<ChatScreenState> {
  ChatScreenController() : super(ChatScreenState.defaultState);
  void setNewChat(bool value) {
    emit(state.copyWith(isNewChat: value));
  }

  void setAiModel(AiModel aiModel) {
    emit(state.copyWith(currentAiModel: aiModel));
  }
}
