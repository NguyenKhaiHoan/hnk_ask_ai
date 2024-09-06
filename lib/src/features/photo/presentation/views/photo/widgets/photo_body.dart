part of '../photo_screen.dart';

class PhotoBody extends GetView<PhotoScreenController> {
  const PhotoBody({super.key});

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
                onPressed: () => controller.setRandomPage(),
              )
            ],
          ),
          gapH12,
          Expanded(child: Obx(() {
            final randomPage = controller.state.value.randomPage;
            return FutureBuilder(
              key: Key('$randomPage'),
              future: controller.getPhotos(page: randomPage),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PhotoModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.dark,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(e.toString()));
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return MasonryGridView.count(
                    padding: const EdgeInsets.only(bottom: 24),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      final photo = data[index];
                      final width = ((size.width - 16) / 2);
                      final height = ((width * photo.height) / photo.width);
                      return NetworkImages(
                        url: photo.downloadUrl,
                        width: width,
                        height: height,
                      );
                    },
                  );
                } else {
                  return const Text('No data available');
                }
              },
            );
          })),
        ],
      ),
    );
  }
}
