part of '../../chat_screen.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (context, index) =>
              _buildModelItem(context: context, index: index),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<ChatScreenController, ChatScreenState>(
            buildWhen: (previous, current) {
              return previous.currentAiModel != current.currentAiModel;
            },
            builder: (context, state) {
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Ask AI '.hardcoded, style: AppStyles.heading4()),
                    TextSpan(
                        text: state.currentAiModel.name.substring(3),
                        style: AppStyles.heading4()
                            .copyWith(color: AppColors.shipGray)),
                  ],
                ),
              );
            },
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

  Widget _buildModelItem({required BuildContext context, required int index}) {
    final aiModel = aiModels[index];
    return InkWell(
      onTap: () => context.read<ChatScreenController>().setAiModel(aiModel),
      child: Row(
        children: [
          BlocBuilder<ChatScreenController, ChatScreenState>(
            builder: (context, state) {
              return SvgIcon(
                iconPath: Assets.images.check.path,
                iconSize: 18,
                colorFilter: ColorFilter.mode(
                    aiModel == state.currentAiModel
                        ? AppColors.dark
                        : AppColors.light,
                    BlendMode.srcIn),
              );
            },
          ),
          gapW4,
          Text(
            aiModel.name,
            style: AppStyles.paragraph1Regular(),
          ),
          const Spacer(),
          SvgIcon(iconPath: aiModel.iconPath),
        ],
      ),
    );
  }
}
