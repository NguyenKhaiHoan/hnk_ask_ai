part of '../../chat_screen.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isChat;

  const ChatAppBar({super.key, required this.isChat});

  @override
  State<ChatAppBar> createState() => _ChatAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatAppBarState extends State<ChatAppBar> {
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
      title: const ChatAppBarTitle(),
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
}
