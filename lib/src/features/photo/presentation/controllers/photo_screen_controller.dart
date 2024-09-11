import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/photo_screen_state.dart';

class PhotoScreenController extends Cubit<PhotoScreenState> {
  PhotoScreenController() : super(PhotoScreenState.defaultState);
  void setRandomPage() {
    final randomPage = Random().nextInt(5);
    emit(state.copyWith(randomPage: randomPage));
  }
}
