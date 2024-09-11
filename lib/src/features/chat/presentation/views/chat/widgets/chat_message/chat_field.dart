part of '../../chat_screen.dart';

class ChatField extends StatefulWidget {
  const ChatField({super.key});

  @override
  State<ChatField> createState() => _FieldChatState();
}

class _FieldChatState extends State<ChatField> {
  late TextEditingController _chatTextController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _chatTextController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    context.read<ChatFieldController>().setHiddenIcons(_focusNode.hasFocus);
  }

  @override
  void dispose() {
    _chatTextController.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 40, maxHeight: 70 + 40 + 12),
        child: BlocBuilder<ChatFieldController, ChatFieldState>(
          builder: (context, state) {
            return Row(
              children: [
                state.isHiddenIcons
                    ? _buildToggleIcon(context: context)
                    : _buildActionIcons(context: context),
                gapW12,
                _buildTextField(context: context),
                gapW12,
                _buildSubmitIcon(context: context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleIcon({required BuildContext context}) {
    return GestureDetector(
      onTap: () => context.read<ChatFieldController>().toggleHiddenIcons(),
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

  Widget _buildActionIcons({required BuildContext context}) {
    return Row(
      children: [
        SvgIcon(iconPath: Assets.images.camera.path),
        gapW12,
        SvgIcon(
          iconPath: Assets.images.image.path,
          onPressed: () => context.read<ChatFieldController>().addImage(),
        ),
        gapW12,
        SvgIcon(iconPath: Assets.images.folder.path),
      ],
    );
  }

  Widget _buildTextField({required BuildContext context}) {
    return BlocBuilder<ChatFieldController, ChatFieldState>(
      builder: (context, state) {
        return Expanded(
          child: CustomTextFormField(
            images: state.images,
            textController: _chatTextController,
            focusNode: _focusNode,
            onChanged: (value) => context
                .read<ChatFieldController>()
                .setTyping(_chatTextController.text.isNotEmpty),
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
          ),
        );
      },
    );
  }

  Widget _buildSubmitIcon({required BuildContext context}) {
    return BlocBuilder<ChatFieldController, ChatFieldState>(
        builder: (context, state) {
      return !state.isTyping
          ? SvgIcon(iconPath: Assets.images.headphones.path)
          : BlocBuilder<ChatFieldController, ChatFieldState>(
              builder: (context, state) {
              return Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  shape: BoxShape.circle,
                ),
                child: SvgIcon(
                  iconPath: state.isLoadingResponse
                      ? Assets.images.loading.path
                      : Assets.images.arrowUp.path,
                  iconSize: state.isLoadingResponse ? 10 : 20,
                  colorFilter:
                      const ColorFilter.mode(AppColors.light, BlendMode.srcIn),
                  onPressed: () => state.isLoadingResponse
                      ? {}
                      : _sendMessage(context, state.images),
                ),
              );
            });
    });
  }

  void _sendMessage(BuildContext context, List<XFile> images) {
    context.read<ChatFieldController>().sendMessage(
        geminiModel: GenerativeModel(
            model: 'gemini-1.5-flash', apiKey: Env.geminiApiKey),
        content: _chatTextController.text.trim(),
        image: images.isNotEmpty ? images.first : null);
    _chatTextController.clear();
  }
}
