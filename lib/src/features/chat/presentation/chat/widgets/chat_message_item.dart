import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/markdown_viewer.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/enums/message_sender.dart';
import '../../../domain/model/message_model.dart';

class ChatMessageItem extends StatelessWidget {
  final MessageModel message;

  const ChatMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isAskAi = message.sender == MessageSender.askAi;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: defaultRoundedCorners,
      ),
      alignment: isAskAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Row(
        mainAxisAlignment:
            isAskAi ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAskAi)
            SvgIcon(
              iconPath: Assets.images.askAiDarkIcon.path,
              iconSize: 25,
              notNeedColorFilter: true,
            ),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isAskAi ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  isAskAi ? 'Ask AI' : 'You',
                  style: AppStyles.heading4(),
                ),
                MarkdownViewer(content: message.content)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
