import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'states/photo_screen_state.dart';

part 'photo_screen_controller.g.dart';

@riverpod
class PhotoScreenController extends _$PhotoScreenController {
  @override
  PhotoScreenState build() {
    return PhotoScreenState.defaultState;
  }

  void setRandomPage() {
    final randomPage = Random().nextInt(5);
    state = state.copyWith(randomPage: randomPage);
  }
}
