import 'package:hnk_ask_ai/src/features/photo/data/repositories/photo_repository.dart';
import 'package:hnk_ask_ai/src/features/photo/domain/photo_model.dart';

class PhotoService {
  final PhotoRepository _photoRepository;

  PhotoService({required PhotoRepository photoRepository})
      : _photoRepository = photoRepository;

  Future<List<PhotoModel>> getPhotos(
      {required int page, required int limit}) async {
    return await _photoRepository.getPhotos(page: page, limit: limit);
  }
}
