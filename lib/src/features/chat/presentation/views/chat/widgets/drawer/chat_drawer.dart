part of '../../chat_screen.dart';

class ChatDrawer extends ConsumerStatefulWidget {
  const ChatDrawer({super.key});

  @override
  ConsumerState<ChatDrawer> createState() => _ChatDrawerState();
}

class _ChatDrawerState extends ConsumerState<ChatDrawer> {
  late TextEditingController _searchTextController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    ref
        .read(chatDrawerControllerProvider.notifier)
        .setCollapse(_focusNode.hasFocus);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isCollapse = ref.watch(chatDrawerControllerProvider.select(
        (state) => (state.value ?? ChatDrawerState.defaultState).isCollapse));
    return AnimatedContainer(
      width: isCollapse ? 1.sw * 0.8 : 1.sw,
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              child: CustomTextFormField(
                textController: _searchTextController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SvgIcon(
                    iconPath: Assets.images.search.path,
                    iconSize: 15,
                    colorFilter: const ColorFilter.mode(
                        AppColors.shipGray, BlendMode.srcIn),
                  ),
                ),
                focusNode: _focusNode,
                onChanged: (value) {},
                hintText: 'Search'.hardcoded,
                onSubmited: (value) {},
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: defaultSmallPadding,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgIcon(
                  iconPath: Assets.images.askAiDarkIcon.path,
                  notNeedColorFilter: true,
                  iconSize: 32,
                ),
                title: Text(
                  'Ask AI'.hardcoded,
                  style: AppStyles.paragraph1Bold(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgIcon(
                  iconPath: Assets.images.explore.path,
                  colorFilter:
                      const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
                  iconSize: 32,
                ),
                title: Text(
                  'Explore Ask AI'.hardcoded,
                  style: AppStyles.paragraph1Bold(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              gapH12,
              const Divider(
                color: AppColors.tuatara,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const ChatDrawerBottom(),
      ),
    );
  }
}
