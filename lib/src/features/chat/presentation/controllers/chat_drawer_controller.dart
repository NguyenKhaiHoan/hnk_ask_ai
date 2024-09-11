import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/chat_drawer_state.dart';

class ChatDrawerController extends Cubit<ChatDrawerState> {
  ChatDrawerController() : super(ChatDrawerState.defaultState);

  void setCollapseWhenFocus(bool hasFocus) {
    if (hasFocus && state.isCollapse) {
      setCollapse(false);
    } else {
      setCollapse(true);
    }
  }

  void setCollapse(bool value) {
    emit(state.copyWith(isCollapse: true));
  }
}
