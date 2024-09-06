import 'package:hnk_ask_ai/src/core/config/config.dart';
import 'package:hnk_ask_ai/src/features/photo/domain/photo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_controller.g.dart';

@riverpod
Future<List<PhotoModel>> getPhotos(GetPhotosRef ref,
    {required int page, int limit = 10}) {
  final photoService = ref.watch(photoServiceProvider);
  return photoService.getPhotos(page: page, limit: limit);
}
