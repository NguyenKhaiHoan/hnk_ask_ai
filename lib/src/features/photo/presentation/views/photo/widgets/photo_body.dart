part of '../photo_screen.dart';

class PhotoBody extends StatefulWidget {
  const PhotoBody({super.key});

  @override
  State<PhotoBody> createState() => _PhotoBodyState();
}

class _PhotoBodyState extends State<PhotoBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: defaultSmallPadding,
      child: Column(
        children: [
          gapH12,
          Row(
            children: [
              Text(
                'Lorem Picsum',
                style: AppStyles.heading2().copyWith(fontFamily: FontFamily.me),
              ),
              const Spacer(),
              SvgIcon(
                iconPath: Assets.images.refresh.path,
                colorFilter:
                    const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
                onPressed: () {},
              )
            ],
          ),
          gapH12,
          Expanded(
            child: MasonryGridView.count(
              padding: const EdgeInsets.only(bottom: 24),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: 5,
              itemBuilder: (context, index) {
                final photo = PhotoModel(
                    id: '',
                    author: '',
                    url: '',
                    downloadUrl: '',
                    width: 100,
                    height: 100);
                final width = ((size.width - 16) / 2);
                final height = ((width * photo.height) / photo.width);
                return NetworkImages(
                  url: photo.downloadUrl,
                  width: width,
                  height: height,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
