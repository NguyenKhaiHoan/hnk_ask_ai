import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/chat_service.dart';
import '../states/chat_field_state.dart';

class ChatFieldController extends Cubit<ChatFieldState> {
  final ChatService chatService;

  ChatFieldController(this.chatService) : super(ChatFieldState.defaultState);

  void setHiddenIconsWhenFocus(bool hasFocus) {
    if (hasFocus && state.isHiddenIcons) {
      setHiddenIcons(false);
    } else {
      setHiddenIcons(true);
    }
  }

  void setHiddenIcons(bool value) {
    emit(state.copyWith(isHiddenIcons: value));
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
    emit(state.copyWith(isTyping: value));
  }

  Future<void> addImage() async {
    final pickedImage = await chatService.pickImage();
    if (pickedImage == null) {
      return;
    }
    final images = state.images;
    images.add(pickedImage);
    emit(state.copyWith(images: images));
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
    emit(state.copyWith(isLoadingResponse: value));
  }
}
