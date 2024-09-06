part of 'network_image.dart';

class LoadingImage extends StatelessWidget {
  const LoadingImage({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: height ?? double.infinity,
        width: width ?? 1.sw,
        child: const Center(
            child: CircularProgressIndicator(color: AppColors.dark)),
      ),
    );
  }
}
