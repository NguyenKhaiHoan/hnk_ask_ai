import 'dart:math';

import 'package:get/get.dart';

import '../../application/photo_service.dart';
import '../../domain/photo_model.dart';
import '../states/photo_screen_state.dart';

class PhotoScreenController extends GetxController {
  var state = PhotoScreenState.defaultState.obs;

  final photoService = Get.find<PhotoService>();

  void setRandomPage() {
    final randomPage = Random().nextInt(5);
    state.value = state.value.copyWith(randomPage: randomPage);
  }

  Future<List<PhotoModel>> getPhotos({required int page, int limit = 10}) {
    return photoService.getPhotos(page: page, limit: limit);
  }
}
