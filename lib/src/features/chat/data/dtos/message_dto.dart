// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/message_sender.dart';
import '../../domain/message_model.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String id,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') required int createdAt,
    required MessageSender sender,
    required String content,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, Object?> json) =>
      _$MessageDtoFromJson(json);
}

extension MessageDtoMapper on MessageDto {
  MessageModel dtoMapperToModel(MessageDto dto) => MessageModel(
        id: dto.id,
        imageUrl: dto.imageUrl,
        createdAt: DateTime.fromMillisecondsSinceEpoch(dto.createdAt),
        sender: dto.sender,
        content: dto.content,
      );
}
