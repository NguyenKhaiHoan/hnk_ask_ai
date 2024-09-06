part of '../../chat_screen.dart';

class ChatField extends ConsumerStatefulWidget {
  const ChatField({super.key});

  @override
  ConsumerState<ChatField> createState() => _FieldChatState();
}

class _FieldChatState extends ConsumerState<ChatField> {
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
    ref
        .read(chatFieldControllerProvider.notifier)
        .setHiddenIcons(_focusNode.hasFocus);
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
    var isHiddenIcons = ref.watch(
        chatFieldControllerProvider.select((state) => state.isHiddenIcons));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 40, maxHeight: 70 + 40 + 12),
        child: Row(
          children: [
            isHiddenIcons ? _buildToggleIcon() : _buildActionIcons(),
            gapW12,
            _buildTextField(),
            gapW12,
            _buildSubmitIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleIcon() {
    return GestureDetector(
      onTap: () =>
          ref.read(chatFieldControllerProvider.notifier).toggleHiddenIcons(),
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
          onPressed: () =>
              ref.read(chatFieldControllerProvider.notifier).addImage(),
        ),
        gapW12,
        SvgIcon(iconPath: Assets.images.folder.path),
      ],
    );
  }

  Widget _buildTextField() {
    var images =
        ref.watch(chatFieldControllerProvider.select((state) => state.images));
    return Expanded(
      child: CustomTextFormField(
        images: images,
        textController: _chatTextController,
        focusNode: _focusNode,
        onChanged: (value) => ref
            .read(chatFieldControllerProvider.notifier)
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
  }

  Widget _buildSubmitIcon() {
    var isTyping = ref
        .watch(chatFieldControllerProvider.select((state) => state.isTyping));
    return !isTyping
        ? SvgIcon(iconPath: Assets.images.headphones.path)
        : Consumer(builder: (context, ref, child) {
            var isLoadingResponse = ref.watch(chatFieldControllerProvider
                .select((state) => state.isLoadingResponse));
            return Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.dark,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Consumer(
                  builder: (context, ref, child) {
                    var images = ref.watch(chatFieldControllerProvider
                        .select((state) => state.images));
                    return SvgIcon(
                      iconPath: isLoadingResponse
                          ? Assets.images.loading.path
                          : Assets.images.arrowUp.path,
                      iconSize: isLoadingResponse ? 10 : 20,
                      colorFilter: const ColorFilter.mode(
                          AppColors.light, BlendMode.srcIn),
                      onPressed: () =>
                          isLoadingResponse ? {} : _sendMessage(images),
                    );
                  },
                ),
              ),
            );
          });
  }

  void _sendMessage(List<XFile> images) {
    ref.read(chatFieldControllerProvider.notifier).sendMessage(
        geminiModel: GenerativeModel(
            model: 'gemini-1.5-flash', apiKey: Env.geminiApiKey),
        content: _chatTextController.text.trim(),
        image: images.isNotEmpty ? images.first : null);
    _chatTextController.clear();
  }
}
