import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hnk_ask_ai/src/core/config/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/chat_field_state.dart';

part 'chat_field_controller.g.dart';

@riverpod
class ChatFieldController extends _$ChatFieldController {
  @override
  FutureOr<ChatFieldState> build() {
    return ChatFieldState.defaultState;
  }

  void setHiddenIconsWhenFocus(bool hasFocus) {
    final isHiddenIcons =
        (state.value ?? ChatFieldState.defaultState).isHiddenIcons;
    if (hasFocus && isHiddenIcons) {
      setHiddenIcons(false);
    } else {
      setHiddenIcons(true);
    }
  }

  void setHiddenIcons(bool value) {
    state = state
        .whenData((screenState) => screenState.copyWith(isHiddenIcons: value));
  }

  void toggleHiddenIcons() {
    final isHiddenIcons =
        (state.value ?? ChatFieldState.defaultState).isHiddenIcons;
    setHiddenIcons(!isHiddenIcons);
  }

  void setTypingWhenFocus(bool hasFocus) {
    final isTyping = (state.value ?? ChatFieldState.defaultState).isTyping;
    if (hasFocus && !isTyping) {
      setTyping(true);
    }
  }

  void setTyping(bool value) {
    state =
        state.whenData((screenState) => screenState.copyWith(isTyping: value));
  }

  Future<void> addImage() async {
    final chatService = ref.read(chatServiceProvider);
    final pickedImage = await chatService.pickImage();
    if (pickedImage == null) {
      return;
    }
    final images = (state.value ?? ChatFieldState.defaultState).images;
    images.add(pickedImage);
    state =
        state.whenData((screenState) => screenState.copyWith(images: images));
  }

  void sendMessage({
    XFile? image,
    required GenerativeModel geminiModel,
    required String content,
  }) async {
    final chatService = ref.read(chatServiceProvider);
    state = state.whenData((screenState) =>
        screenState.copyWith(images: [], isLoadingResponse: true));
    await chatService.sendMessage(
        geminiModel: geminiModel, content: content, image: image);
    state = state.whenData(
        (screenState) => screenState.copyWith(isLoadingResponse: false));
  }

  void setLoadingResponse(bool value) {
    state = state.whenData(
        (screenState) => screenState.copyWith(isLoadingResponse: value));
  }
}
