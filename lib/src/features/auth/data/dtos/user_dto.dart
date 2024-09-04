// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_model.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'auth_by') required String authBy,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoMapper on UserDto {
  UserModel dtoMapperToModel(UserDto dto) => UserModel(
        id: dto.id,
        createdAt: DateTime.fromMillisecondsSinceEpoch(dto.createdAt),
        imageUrl: dto.imageUrl,
        email: dto.email,
        firstName: dto.firstName,
        lastName: dto.lastName,
        authBy: dto.authBy,
      );
}
