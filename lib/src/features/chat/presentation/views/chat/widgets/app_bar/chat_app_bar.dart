part of '../../chat_screen.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isNewChat = ref
        .watch(chatScreenControllerProvider.select((state) => state.isNewChat));
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
                isNewChat ? AppColors.dark : AppColors.masala, BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
