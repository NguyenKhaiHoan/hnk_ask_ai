import '../../../core/enums/message_sender.dart';
import '../data/dtos/message_dto.dart';

class MessageModel {
  final String id;
  final String? imageUrl;
  final DateTime createdAt;
  final MessageSender sender;
  final String content;
  MessageModel({
    required this.id,
    this.imageUrl,
    required this.createdAt,
    required this.sender,
    required this.content,
  });

  MessageModel copyWith({
    String? id,
    String? imageUrl,
    DateTime? createdAt,
    MessageSender? sender,
    String? content,
  }) {
    return MessageModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      sender: sender ?? this.sender,
      content: content ?? this.content,
    );
  }
}

extension MessageModelMapper on MessageModel {
  MessageDto modelMapperToDto(MessageModel model) => MessageDto(
        id: model.id,
        createdAt: model.createdAt.millisecondsSinceEpoch,
        sender: model.sender,
        content: model.content,
      );
}
