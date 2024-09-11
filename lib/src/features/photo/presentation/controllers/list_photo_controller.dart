import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/failure.dart';
import '../../application/photo_service.dart';
import '../states/list_photo_state.dart';

class ListPhotoController extends Cubit<ListPhotoState> {
  final PhotoService photoService;

  ListPhotoController(this.photoService)
      : super(const ListPhotoState.loading());

  Future<void> getPhotos({required int page, int limit = 10}) async {
    try {
      final photos = await photoService.getPhotos(page: page, limit: limit);
      emit(ListPhotoState.data(photos: photos));
    } catch (error) {
      emit(ListPhotoState.error(failure: Failure(message: error.toString())));
    }
  }
}
