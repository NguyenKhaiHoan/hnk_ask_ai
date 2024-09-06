import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../states/chat_drawer_state.dart';

class ChatDrawerController extends GetxController {
  var state = ChatDrawerState.defaultState.obs;

  TextEditingController searchTextController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setCollapseWhenFocus(focusNode.hasFocus);
  }

  @override
  void dispose() {
    searchTextController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void setCollapseWhenFocus(bool hasFocus) {
    if (hasFocus && state.value.isCollapse) {
      setCollapse(false);
    } else {
      setCollapse(true);
    }
  }

  void setCollapse(bool value) {
    state.value = state.value.copyWith(isCollapse: true);
  }
}
