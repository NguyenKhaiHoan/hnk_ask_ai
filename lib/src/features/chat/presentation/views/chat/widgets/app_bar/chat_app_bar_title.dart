part of '../../chat_screen.dart';

class ChatAppBarTitle extends GetView<ChatScreenController> {
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
          itemBuilder: (context, index) => _buildModelItem(index: index),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            var curentAiModel = controller.state.value.currentAiModel;
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Ask AI '.hardcoded, style: AppStyles.heading4()),
                  TextSpan(
                      text: curentAiModel.name.substring(3),
                      style: AppStyles.heading4()
                          .copyWith(color: AppColors.shipGray)),
                ],
              ),
            );
          }),
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

  Widget _buildModelItem({required int index}) {
    final aiModel = aiModels[index];
    return InkWell(
      onTap: () => controller.setAiModel(aiModel),
      child: Row(
        children: [
          Obx(
            () {
              var currentAiModel = controller.state.value.currentAiModel;
              return SvgIcon(
                iconPath: Assets.images.check.path,
                iconSize: 18,
                colorFilter: ColorFilter.mode(
                    aiModel == currentAiModel
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
