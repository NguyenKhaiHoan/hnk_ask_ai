part of '../../chat_screen.dart';

class ListMessageItem extends StatelessWidget {
  final MessageModel message;

  const ListMessageItem({super.key, required this.message});

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
                MarkdownViewer(content: message.content),
                message.imageUrl != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.network(
                          message.imageUrl!,
                          height: 70,
                          fit: BoxFit.cover,
                        ))
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
