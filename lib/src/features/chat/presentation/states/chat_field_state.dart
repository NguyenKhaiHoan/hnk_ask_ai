import 'package:image_picker/image_picker.dart';

class ChatFieldState {
  final bool isHiddenIcons;
  final bool isTyping;
  final bool isLoadingResponse;
  final List<XFile> images;

  ChatFieldState(
      {required this.isHiddenIcons,
      required this.isTyping,
      required this.isLoadingResponse,
      required this.images});

  static ChatFieldState get defaultState => ChatFieldState(
        isHiddenIcons: true,
        isTyping: false,
        isLoadingResponse: false,
        images: [],
      );

  ChatFieldState copyWith(
      {bool? isHiddenIcons,
      bool? isTyping,
      bool? isLoadingResponse,
      List<XFile>? images}) {
    return ChatFieldState(
      isHiddenIcons: isHiddenIcons ?? this.isHiddenIcons,
      isTyping: isTyping ?? this.isTyping,
      isLoadingResponse: isLoadingResponse ?? this.isLoadingResponse,
      images: images ?? this.images,
    );
  }
}
