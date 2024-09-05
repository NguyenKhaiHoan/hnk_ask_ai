class ChatDrawerState {
  final bool isCollapse;

  ChatDrawerState({required this.isCollapse});

  static ChatDrawerState get defaultState => ChatDrawerState(
        isCollapse: true,
      );

  ChatDrawerState copyWith({
    bool? isCollapse,
  }) {
    return ChatDrawerState(
      isCollapse: isCollapse ?? this.isCollapse,
    );
  }
}
