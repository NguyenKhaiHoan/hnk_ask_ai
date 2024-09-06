import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/chat_drawer_state.dart';

part 'chat_drawer_controller.g.dart';

@riverpod
class ChatDrawerController extends _$ChatDrawerController {
  @override
  ChatDrawerState build() {
    return ChatDrawerState.defaultState;
  }

  void setCollapseWhenFocus(bool hasFocus) {
    if (hasFocus && state.isCollapse) {
      setCollapse(false);
    } else {
      setCollapse(true);
    }
  }

  void setCollapse(bool value) {
    state = state.copyWith(isCollapse: true);
  }
}
