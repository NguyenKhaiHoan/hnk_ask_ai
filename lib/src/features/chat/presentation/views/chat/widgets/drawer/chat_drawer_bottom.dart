part of '../../chat_screen.dart';

class ChatDrawerBottom extends GetView<AuthController> {
  const ChatDrawerBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: defaultBigPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 21,
                child: SvgIcon(
                  iconPath: Assets.images.photoDarkIcon.path,
                  notNeedColorFilter: true,
                  iconSize: 42,
                ),
              ),
              title: Text(
                'Photo Random App'.hardcoded,
                style: AppStyles.paragraph1Bold(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: SvgIcon(
                iconPath: Assets.images.arrow.path,
                colorFilter:
                    const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
                onPressed: () => context.goNamed('photo'),
              ),
            ),
            gapH12,
            const Divider(
              color: AppColors.tuatara,
            ),
            gapH12,
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: defaultRoundedCorners,
                child: SvgIcon(
                  iconPath: Assets.images.darkLogo.path,
                  notNeedColorFilter: true,
                  iconSize: 42,
                ),
              ),
              title: StreamBuilder(
                stream: controller.authStateChanges(),
                builder:
                    (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.dark,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Unknown'.hardcoded,
                      style: AppStyles.paragraph1Bold(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    );
                  } else if (snapshot.hasData) {
                    final user = snapshot.data ?? UserModel.empty;
                    return Text(
                      '${user.lastName} ${user.firstName}',
                      style: AppStyles.paragraph1Bold(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    );
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              trailing: SvgIcon(
                iconPath: Assets.images.ellipsis.path,
                colorFilter:
                    const ColorFilter.mode(AppColors.shipGray, BlendMode.srcIn),
              ),
            )
          ],
        ));
  }
}
