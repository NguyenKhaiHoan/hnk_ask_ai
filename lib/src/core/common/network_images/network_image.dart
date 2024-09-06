import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/svg_icon.dart';

part 'load_image.dart';
part 'error_image.dart';

class NetworkImages extends StatelessWidget {
  const NetworkImages({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.child,
  });

  final String url;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: defaultRoundedCorners,
        child: child ??
            Container(
              height: height ?? 1.sh,
              width: width ?? 1.sw,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ),
      placeholder: (context, url) => LoadingImage(
        height: height,
        width: width,
      ),
      errorWidget: (context, url, error) => ErrorImage(
        height: height,
        width: width,
      ),
    );
  }
}
