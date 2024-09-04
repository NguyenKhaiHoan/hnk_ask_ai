import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/extensions/scroll_controller_extension.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/views/chat/widgets/chat_message_item.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../../../../../auth/domain/user_model.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late ScrollController _scrollController;
  bool _isAtBottom = false;

  @override
  void initState() {
    super.initState();
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
        Consumer(
          builder: (context, ref, child) {
            final userId =
                (ref.watch(authStateChangesProvider).value ?? UserModel.empty)
                    .id;
            final messageData =
                ref.watch(messagesStateChangesProvider(userId: userId));
            return messageData.when(
                data: (data) {
                  return ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    padding: defaultSmallPadding,
                    itemBuilder: (context, index) {
                      return ChatMessageItem(message: data[index]);
                    },
                    separatorBuilder: (context, index) => gapH26,
                    itemCount: data!.length,
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(
                      color: AppColors.dark,
                    ));
          },
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
