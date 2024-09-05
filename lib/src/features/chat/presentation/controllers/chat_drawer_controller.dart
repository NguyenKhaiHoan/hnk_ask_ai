import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/chat_drawer_state.dart';

part 'chat_drawer_controller.g.dart';

@riverpod
class ChatDrawerController extends _$ChatDrawerController {
  @override
  FutureOr<ChatDrawerState> build() {
    return ChatDrawerState.defaultState;
  }

  void setCollapse(bool hasFocus) {
    final isCollapse = (state.value ?? ChatDrawerState.defaultState).isCollapse;
    if (hasFocus && isCollapse) {
      state = state
          .whenData((screenState) => screenState.copyWith(isCollapse: false));
    } else {
      state = state
          .whenData((screenState) => screenState.copyWith(isCollapse: true));
    }
  }
}
