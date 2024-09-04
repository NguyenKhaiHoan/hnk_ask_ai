import 'package:hnk_ask_ai/src/features/photo/domain/photo_model.dart';

import '../../../../core/exceptions/failure.dart';
import '../apis/lorem_picsum_api_service.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final LoremPicsumApiService _loremPicsumApiService;

  PhotoRepositoryImpl({required LoremPicsumApiService loremPicsumApiService})
      : _loremPicsumApiService = loremPicsumApiService;

  @override
  Future<List<PhotoModel>> getPhotos(
      {required int page, required int limit}) async {
    final result =
        await _loremPicsumApiService.getPhotos(page: page, limit: limit);
    return result.fold(
        (e) => throw Failure(message: e.toString()), (data) => data);
  }
}
