import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/gen/fonts.gen.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';

class TextLogo extends StatelessWidget {
  final double fontSize;

  const TextLogo({
    super.key,
    this.fontSize = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'A',
      style: AppStyles.heading1()
          .copyWith(fontSize: fontSize, fontFamily: FontFamily.me),
    );
  }
}
