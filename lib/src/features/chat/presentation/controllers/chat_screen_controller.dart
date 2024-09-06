import 'package:get/get.dart';

import '../../domain/ai_model.dart';
import '../states/chat_screen_state.dart';

class ChatScreenController extends GetxController {
  final state = ChatScreenState.defaultState.obs;

  void setNewChat(bool value) {
    state.value = state.value.copyWith(isNewChat: value);
  }

  void setAiModel(AiModel aiModel) {
    state.value = state.value.copyWith(currentAiModel: aiModel);
  }
}
