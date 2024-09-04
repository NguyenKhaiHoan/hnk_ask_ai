import '../../domain/photo_model.dart';

abstract class PhotoRepository {
  Future<List<PhotoModel>> getPhotos({required int page, required int limit});
}
