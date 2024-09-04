// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/photo_model.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDto with _$PhotoDto {
  const factory PhotoDto({
    required String id,
    required String author,
    double? width,
    double? height,
    required String url,
    @JsonKey(name: "download_url") required String downloadUrl,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, Object?> json) =>
      _$PhotoDtoFromJson(json);
}

extension PhotoDtoMapper on PhotoDto {
  PhotoModel dtoMapperToModel(PhotoDto dto) => PhotoModel(
        id: dto.id,
        author: dto.author,
        url: dto.url,
        downloadUrl: dto.downloadUrl,
      );
}
