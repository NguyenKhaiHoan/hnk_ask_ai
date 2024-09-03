import '../../../../core/enums/message_sender.dart';

class MessageModel {
  final MessageSender sender;
  final String content;

  MessageModel({required this.sender, required this.content});
}
