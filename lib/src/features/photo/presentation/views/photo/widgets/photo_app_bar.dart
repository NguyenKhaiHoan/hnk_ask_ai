part of '../photo_screen.dart';

class PhotoAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PhotoAppBar({super.key});

  @override
  State<PhotoAppBar> createState() => _PhotoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PhotoAppBarState extends State<PhotoAppBar> {
  late TextEditingController _searchTextController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: ClipRRect(
              borderRadius: defaultRoundedCorners,
              child: SvgIcon(
                iconPath: Assets.images.darkLogoPhoto.path,
                notNeedColorFilter: true,
                iconSize: 36,
                onPressed: context.pop,
              ))),
      title: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: CustomTextFormField(
          textController: _searchTextController,
          focusNode: _focusNode,
          onChanged: (value) {},
          hintText: 'Search'.hardcoded,
          onSubmited: (value) {},
        ),
      ),
    );
  }
}
