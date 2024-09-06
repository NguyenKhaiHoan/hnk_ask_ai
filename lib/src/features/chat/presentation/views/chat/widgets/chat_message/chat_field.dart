part of '../../chat_screen.dart';

class ChatField extends GetView<ChatFieldController> {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 40, maxHeight: 70 + 40 + 12),
        child: Obx(
          () {
            var isHiddenIcons = controller.state.value.isHiddenIcons;
            return Row(
              children: [
                isHiddenIcons ? _buildToggleIcon() : _buildActionIcons(),
                gapW12,
                _buildTextField(),
                gapW12,
                _buildSubmitIcon(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleIcon() {
    return GestureDetector(
      onTap: () => controller.toggleHiddenIcons(),
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.wildSand,
          shape: BoxShape.circle,
        ),
        child: SvgIcon(
          iconPath: Assets.images.plus.path,
          colorFilter:
              const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget _buildActionIcons() {
    return Row(
      children: [
        SvgIcon(iconPath: Assets.images.camera.path),
        gapW12,
        SvgIcon(
          iconPath: Assets.images.image.path,
          onPressed: () => controller.addImage(),
        ),
        gapW12,
        SvgIcon(iconPath: Assets.images.folder.path),
      ],
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: Obx(() {
        var images = controller.state.value.images;
        return CustomTextFormField(
          images: images,
          textController: controller.chatTextController,
          focusNode: controller.focusNode,
          onChanged: (value) => controller
              .setTyping(controller.chatTextController.text.isNotEmpty),
          hintText: 'Message'.hardcoded,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SvgIcon(
              iconPath: Assets.images.microphone.path,
              iconSize: 15,
              colorFilter:
                  const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
            ),
          ),
          onSubmited: (value) {},
        );
      }),
    );
  }

  Widget _buildSubmitIcon() {
    return Obx(
      () {
        var isTyping = controller.state.value.isTyping;
        return !isTyping
            ? SvgIcon(iconPath: Assets.images.headphones.path)
            : Obx(() {
                var isLoadingResponse =
                    controller.state.value.isLoadingResponse;
                var images = controller.state.value.images;
                return Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.dark,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SvgIcon(
                      iconPath: isLoadingResponse
                          ? Assets.images.loading.path
                          : Assets.images.arrowUp.path,
                      iconSize: isLoadingResponse ? 10 : 20,
                      colorFilter: const ColorFilter.mode(
                          AppColors.light, BlendMode.srcIn),
                      onPressed: () =>
                          isLoadingResponse ? {} : _sendMessage(images),
                    ),
                  ),
                );
              });
      },
    );
  }

  void _sendMessage(List<XFile> images) {
    controller.sendMessage(
        geminiModel: GenerativeModel(
            model: 'gemini-1.5-flash', apiKey: Env.geminiApiKey),
        content: controller.chatTextController.text.trim(),
        image: images.isNotEmpty ? images.first : null);
    controller.chatTextController.clear();
  }
}
