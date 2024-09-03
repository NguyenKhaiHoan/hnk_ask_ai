part of '../chat_screen.dart';

class FieldChat extends StatefulWidget {
  const FieldChat({super.key});

  @override
  State<FieldChat> createState() => _FieldChatState();
}

class _FieldChatState extends State<FieldChat> {
  bool isIconsHidden = true;
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
    setState(() {
      if (_focusNode.hasFocus && !isIconsHidden) {
        isIconsHidden = true;
      }
    });
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
      child: SizedBox(
        height: 38,
        child: Row(
          children: [
            isIconsHidden ? _buildToggleIcon() : _buildActionIcons(),
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
      onTap: _toggleIconsVisibility,
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
        SvgIcon(iconPath: Assets.images.image.path),
        gapW12,
        SvgIcon(iconPath: Assets.images.folder.path),
      ],
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: CustomTextFormField(
          textController: _chatTextController,
          focusNode: _focusNode,
          onChanged: (value) => setState(() {}),
          hintText: 'Message'.hardcoded,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SvgIcon(
              iconPath: Assets.images.microphone.path,
              iconSize: 20,
              colorFilter:
                  const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
            ),
          )),
    );
  }

  Widget _buildSubmitIcon() {
    return _chatTextController.text.isEmpty
        ? SvgIcon(iconPath: Assets.images.headphones.path)
        : Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.dark,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: SvgIcon(
                iconPath: Assets.images.arrowUp.path,
                iconSize: 20,
                colorFilter:
                    const ColorFilter.mode(AppColors.light, BlendMode.srcIn),
              ),
            ),
          );
  }

  void _toggleIconsVisibility() {
    setState(() {
      isIconsHidden = !isIconsHidden;
    });
  }
}
