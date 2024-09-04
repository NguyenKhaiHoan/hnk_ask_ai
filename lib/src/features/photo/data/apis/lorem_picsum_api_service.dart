import 'package:dartz/dartz.dart';
import 'package:hnk_ask_ai/src/features/photo/domain/photo_model.dart';

abstract class LoremPicsumApiService {
  Future<Either<Exception, List<PhotoModel>>> getPhotos(
      {required int page, required int limit});
}
