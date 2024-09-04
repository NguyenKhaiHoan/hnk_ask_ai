import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/enums/message_sender.dart';
import 'package:hnk_ask_ai/src/core/extensions/scroll_controller_extension.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/message_model.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/views/chat/widgets/chat_message_item.dart';
import 'dart:math' as math;

import '../../../../../../../gen/assets.gen.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late ScrollController _scrollController;
  late List<MessageModel> messages;
  bool _isAtBottom = false;

  @override
  void initState() {
    super.initState();
    messages = [
      MessageModel(
        sender: MessageSender.askAi,
        content: 'Hello! What would you like to learn about Dart today?',
        id: '0',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'Hi! I want to know how to write a simple Dart program.',
        id: '1',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.askAi,
        content:
            'Great! Let\'s start with a basic program that prints "Hello, World!".',
        id: '2',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'Sounds good! How do I begin?',
        id: '3',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.askAi,
        content:
            'First, create a new Dart file and write the following code:\n```dart\nvoid main() {\n  print(\'Hello, World!\');\n}\n```',
        id: '4',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'That\'s simple! How do I run it?',
        id: '5',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.askAi,
        content:
            'You can run it using the Dart SDK. Just open your terminal and type `dart filename.dart`.',
        id: '6',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'Thanks! It worked. Is there anything else I should know?',
        id: '7',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.askAi,
        content:
            'You can try adding user input. For example:\n```dart\nimport \'dart:io\';\n\nvoid main() {\n  stdout.write(\'Enter your name: \');\n  String? name = stdin.readLineSync();\n  print(\'Hello, \$name!\');\n}\n```',
        id: '8',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'Interesting! I\'ll try that.',
        id: '9',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.askAi,
        content: 'Good luck! If you have any more questions, feel free to ask.',
        id: '10',
        createdAt: DateTime.now(),
      ),
      MessageModel(
        sender: MessageSender.user,
        content: 'Thank you so much!',
        id: '11',
        createdAt: DateTime.now(),
      ),
    ];
    _scrollController = ScrollController()
      ..addListener(() {
        final isAtBottom = _scrollController.offset >=
            _scrollController.position.maxScrollExtent - 50;
        if (isAtBottom != _isAtBottom) {
          setState(() {
            _isAtBottom = isAtBottom;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          controller: _scrollController,
          shrinkWrap: true,
          padding: defaultSmallPadding,
          itemBuilder: (context, index) {
            return ChatMessageItem(message: messages[index]);
          },
          separatorBuilder: (context, index) => gapH26,
          itemCount: messages.length,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: !_isAtBottom,
            child: Transform.rotate(
              angle: math.pi,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.light,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dark.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: SvgIcon(
                    onPressed: () => _scrollController.scrollToBottom(),
                    iconPath: Assets.images.arrowUp.path,
                    iconSize: 20,
                    colorFilter:
                        const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
