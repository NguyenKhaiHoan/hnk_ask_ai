import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hnk_ask_ai/src/core/config/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/chat_field_state.dart';

part 'chat_field_controller.g.dart';

@riverpod
class ChatFieldController extends _$ChatFieldController {
  @override
  ChatFieldState build() {
    return ChatFieldState.defaultState;
  }

  void setHiddenIconsWhenFocus(bool hasFocus) {
    if (hasFocus && state.isHiddenIcons) {
      setHiddenIcons(false);
    } else {
      setHiddenIcons(true);
    }
  }

  void setHiddenIcons(bool value) {
    state = state.copyWith(isHiddenIcons: value);
  }

  void toggleHiddenIcons() {
    setHiddenIcons(!state.isHiddenIcons);
  }

  void setTypingWhenFocus(bool hasFocus) {
    if (hasFocus && !state.isTyping) {
      setTyping(true);
    }
  }

  void setTyping(bool value) {
    state = state.copyWith(isTyping: value);
  }

  Future<void> addImage() async {
    final chatService = ref.read(chatServiceProvider);
    final pickedImage = await chatService.pickImage();
    if (pickedImage == null) {
      return;
    }
    final images = state.images;
    images.add(pickedImage);
    state = state.copyWith(images: images);
  }

  void sendMessage({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  }) async {
    final chatService = ref.read(chatServiceProvider);
    setLoadingResponse(true);
    await chatService.sendMessage(
        geminiModel: geminiModel, content: content, image: image);
    setLoadingResponse(false);
  }

  void setLoadingResponse(bool value) {
    state = state.copyWith(isLoadingResponse: value);
  }
}
