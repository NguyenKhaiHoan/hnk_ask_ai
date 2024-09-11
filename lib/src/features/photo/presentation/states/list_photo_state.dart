import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/photo_model.dart';

part 'list_photo_state.freezed.dart';

@freezed
class ListPhotoState with _$ListPhotoState {
  const factory ListPhotoState.loading() = _Loading;
  const factory ListPhotoState.data({required List<PhotoModel> photos}) = _Data;
  const factory ListPhotoState.error({required Failure failure}) = _Error;
}
