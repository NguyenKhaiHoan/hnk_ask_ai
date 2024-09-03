import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';

class SvgIcon extends StatelessWidget {
  final double? iconSize;
  final String iconPath;
  final bool notNeedColorFilter;
  final ColorFilter? colorFilter;
  final VoidCallback? onPressed;

  const SvgIcon({
    super.key,
    required this.iconPath,
    this.notNeedColorFilter = false,
    this.colorFilter,
    this.iconSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        iconPath,
        width: iconSize ?? 24,
        height: iconSize ?? 24,
        allowDrawingOutsideViewBox: true,
        colorFilter: notNeedColorFilter
            ? null
            : colorFilter ??
                const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
      ),
    );
  }
}
