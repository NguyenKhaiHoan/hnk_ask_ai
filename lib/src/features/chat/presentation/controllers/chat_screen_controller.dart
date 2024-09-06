import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/ai_model.dart';
import '../states/chat_screen_state.dart';

part 'chat_screen_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController {
  @override
  ChatScreenState build() {
    return ChatScreenState.defaultState;
  }

  void setNewChat(bool value) {
    state = state.copyWith(isNewChat: value);
  }

  void setAiModel(AiModel aiModel) {
    state = state.copyWith(currentAiModel: aiModel);
  }
}
