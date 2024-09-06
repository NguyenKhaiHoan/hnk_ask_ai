part of 'network_image.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({
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
        width: width ?? MediaQuery.of(context).size.width,
        child: Center(
          child: SvgIcon(
            iconPath: Assets.images.warningCircleFill.path,
            colorFilter:
                const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
