import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';

import '../../constants/constant.dart';
import '../../enums/button_type.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool isLoading;
  final String iconPath;
  final double? iconSize;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final ColorFilter? colorFilter;
  final bool notNeedColorFilter;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.isLoading = false,
    this.iconPath = '',
    this.iconSize,
    this.backgroundColor = AppColors.light,
    this.onPressed,
    this.colorFilter,
    this.notNeedColorFilter = false,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.p50,
      width: double.infinity,
      child: buttonType == ButtonType.elevated
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultRoundedCorners,
                  ),
                  backgroundColor: backgroundColor),
              onPressed: onPressed ?? () {},
              child: _buildChild(),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: defaultRoundedCorners,
                ),
                side: const BorderSide(width: 1.5, color: AppColors.tuatara),
              ),
              child: _buildChild(),
            ),
    );
  }

  Widget _buildChild() {
    if (isLoading) {
      return const CircularProgressIndicator(
        color: AppColors.dark,
      );
    } else if (iconPath.isEmpty) {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: AppStyles.label1Bold().copyWith(color: textColor),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(
            iconPath: iconPath,
            colorFilter: colorFilter,
            iconSize: iconSize,
            notNeedColorFilter: notNeedColorFilter,
          ),
          gapW6,
          Text(
            text,
            style: AppStyles.label1Bold().copyWith(color: textColor),
          ),
        ],
      );
    }
  }
}
