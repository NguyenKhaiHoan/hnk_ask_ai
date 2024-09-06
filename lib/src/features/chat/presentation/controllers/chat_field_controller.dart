import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/chat_service.dart';
import '../states/chat_field_state.dart';

class ChatFieldController extends GetxController {
  var state = ChatFieldState.defaultState.obs;

  final chatService = Get.find<ChatService>();

  final TextEditingController chatTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setHiddenIcons(focusNode.hasFocus);
  }

  @override
  void dispose() {
    chatTextController.dispose();
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void setHiddenIconsWhenFocus(bool hasFocus) {
    if (hasFocus && state.value.isHiddenIcons) {
      setHiddenIcons(false);
    } else {
      setHiddenIcons(true);
    }
  }

  void setHiddenIcons(bool value) {
    state.value = state.value.copyWith(isHiddenIcons: value);
  }

  void toggleHiddenIcons() {
    setHiddenIcons(!state.value.isHiddenIcons);
  }

  void setTypingWhenFocus(bool hasFocus) {
    if (hasFocus && !state.value.isTyping) {
      setTyping(true);
    }
  }

  void setTyping(bool value) {
    state.value = state.value.copyWith(isTyping: value);
  }

  Future<void> addImage() async {
    final pickedImage = await chatService.pickImage();
    if (pickedImage == null) {
      return;
    }
    final images = state.value.images;
    images.add(pickedImage);
    state.value = state.value.copyWith(images: images);
  }

  void sendMessage({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  }) async {
    setLoadingResponse(true);
    await chatService.sendMessage(
        geminiModel: geminiModel, content: content, image: image);
    setLoadingResponse(false);
  }

  void setLoadingResponse(bool value) {
    state.value = state.value.copyWith(isLoadingResponse: value);
  }
}
