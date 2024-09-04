part of '../chat_screen.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isChat;

  const ChatAppBar({super.key, required this.isChat});

  @override
  State<ChatAppBar> createState() => _ChatAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatAppBarState extends State<ChatAppBar> {
  late AiModel currentModel;
  late List<AiModel> aiModels;

  @override
  void initState() {
    aiModels = [
      AiModel(
          type: AiType.gemini15Flash,
          name: 'AI-1.5 Flash'.hardcoded,
          iconPath: Assets.images.gpt35.path),
      AiModel(
          type: AiType.gemini15Pro,
          name: 'AI-1.5 Pro'.hardcoded,
          iconPath: Assets.images.gpt4.path),
    ];
    currentModel = aiModels[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        child: Builder(builder: (context) {
          return SvgIcon(
            iconPath: Assets.images.menu.path,
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      title: _buildAppBarTitle(),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SvgIcon(
            iconPath: Assets.images.newMessage.path,
            colorFilter: ColorFilter.mode(
                widget.isChat ? AppColors.dark : AppColors.masala,
                BlendMode.srcIn),
          ),
        )
      ],
    );
  }

  Widget _buildAppBarTitle() {
    return CustomPopup(
      showArrow: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      barrierColor: AppColors.dark.withOpacity(0.3),
      contentDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: defaultRoundedCorners,
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 1),
            spreadRadius: 2,
          )
        ],
      ),
      content: SizedBox(
        width: 262,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: aiModels.length,
          itemBuilder: (context, index) => _buildModelItem(index),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Ask AI '.hardcoded, style: AppStyles.heading4()),
                TextSpan(
                    text: currentModel.name.substring(3),
                    style: AppStyles.heading4()
                        .copyWith(color: AppColors.shipGray)),
              ],
            ),
          ),
          SvgIcon(
            iconPath: Assets.images.arrow.path,
            colorFilter:
                const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
            iconSize: 16,
          )
        ],
      ),
    );
  }

  void changeAiModel(AiModel selectedModel) {
    setState(() {
      currentModel = selectedModel;
    });
  }

  Widget _buildModelItem(int index) {
    final model = aiModels[index];
    return InkWell(
      onTap: () => changeAiModel(model),
      child: Row(
        children: [
          SvgIcon(
            iconPath: Assets.images.check.path,
            iconSize: 18,
            colorFilter: ColorFilter.mode(
                model == currentModel ? AppColors.dark : AppColors.light,
                BlendMode.srcIn),
          ),
          gapW4,
          Text(
            model.name,
            style: AppStyles.paragraph1Regular(),
          ),
          const Spacer(),
          SvgIcon(iconPath: model.iconPath),
        ],
      ),
    );
  }
}
