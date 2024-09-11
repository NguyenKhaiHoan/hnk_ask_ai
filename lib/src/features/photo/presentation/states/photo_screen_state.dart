class PhotoScreenState {
  final int randomPage;

  PhotoScreenState({required this.randomPage});

  static PhotoScreenState get defaultState => PhotoScreenState(
        randomPage: 0,
      );

  PhotoScreenState copyWith({
    int? randomPage,
  }) {
    return PhotoScreenState(
      randomPage: randomPage ?? this.randomPage,
    );
  }
}
