import '../../../features/auth/data/dtos/user_dto.dart';
import '../../../features/auth/domain/user_model.dart';

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

extension UserModelMapper on UserModel {
  UserDto modelMapperToDto(UserModel model) => UserDto(
        id: model.id,
        createdAt: model.createdAt.millisecondsSinceEpoch,
        imageUrl: model.imageUrl,
        email: model.email,
        firstName: model.firstName,
        lastName: model.lastName,
        authBy: model.authBy,
      );
}
