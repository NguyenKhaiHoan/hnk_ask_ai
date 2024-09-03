import 'package:hnk_ask_ai/src/features/chat/data/dtos/message_dto.dart';

import '../../../features/chat/domain/message_model.dart';

extension MessageDtoMapper on MessageDto {
  MessageModel dtoMapperToModel(MessageDto dto) => MessageModel(
        id: dto.id,
        createdAt: DateTime.fromMillisecondsSinceEpoch(dto.createdAt),
        sender: dto.sender,
        content: dto.content,
      );
}

extension MessageModelMapper on MessageModel {
  MessageDto modelMapperToDto(MessageModel model) => MessageDto(
        id: model.id,
        createdAt: model.createdAt.millisecondsSinceEpoch,
        sender: model.sender,
        content: model.content,
      );
}
