import 'package:dartz/dartz.dart';
import 'package:hnk_ask_ai/src/core/base/base_api_service.dart';
import 'package:hnk_ask_ai/src/features/photo/data/apis/retrofit_lorem_picsum_api.dart';

import '../../domain/photo_model.dart';
import '../dtos/photo_dto.dart';
import 'lorem_picsum_api_service.dart';

class LoremPicsumApiServiceImpl extends BaseApiService
    implements LoremPicsumApiService {
  final RetrofitPhotoApi _retrofitPhotoApi;

  LoremPicsumApiServiceImpl({required RetrofitPhotoApi retrofitPhotoApi})
      : _retrofitPhotoApi = retrofitPhotoApi;

  @override
  Future<Either<Exception, List<PhotoModel>>> getPhotos(
      {required int page, required int limit}) {
    return handleApiCallWithList<PhotoModel>(
      apiCall: () => _retrofitPhotoApi.getPhotos(page: page, limit: limit),
      dtoToModel: (dtos) =>
          dtos.map((dto) => (dto as PhotoDto).dtoMapperToModel(dto)).toList(),
    );
  }
}
