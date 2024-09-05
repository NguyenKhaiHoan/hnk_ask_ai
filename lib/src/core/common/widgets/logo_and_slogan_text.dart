import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/gen/fonts.gen.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

class LogoAndSloganText extends StatelessWidget {
  const LogoAndSloganText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'A'.hardcoded,
          style: AppStyles.heading1().copyWith(
            fontFamily: FontFamily.me,
            fontSize: 72,
            height: 1.0,
          ),
        ),
        Text(
          'Ask Ai Anything'.hardcoded,
          style: AppStyles.heading2().copyWith(fontFamily: FontFamily.me),
        ),
      ],
    );
  }
}
