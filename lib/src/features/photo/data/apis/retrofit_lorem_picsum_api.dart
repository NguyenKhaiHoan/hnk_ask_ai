import 'package:dio/dio.dart';
import 'package:hnk_ask_ai/src/features/photo/data/dtos/photo_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_lorem_picsum_api.g.dart';

@RestApi(baseUrl: 'https://picsum.photos/v2/')
abstract class RetrofitPhotoApi {
  factory RetrofitPhotoApi(Dio dio) = _RetrofitPhotoApi;

  @GET('/list?page={page}&limit={limit}')
  Future<HttpResponse<List<PhotoDto>>> getPhotos({
    @Path('page') required int page,
    @Path('limit') required int limit,
  });
}
