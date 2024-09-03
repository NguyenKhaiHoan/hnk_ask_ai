import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../gen/fonts.gen.dart';
import '../../constants/constant.dart';

class MarkdownViewer extends StatelessWidget {
  final String content;

  const MarkdownViewer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: content,
      styleSheet: MarkdownStyleSheet(
          code: AppStyles.paragraph2Regular().copyWith(
            fontFamily: FontFamily.roMo,
            letterSpacing: -0.3,
          ),
          h1: AppStyles.heading1(),
          h2: AppStyles.heading2(),
          h3: AppStyles.heading3(),
          h4: AppStyles.heading4(),
          h5: AppStyles.heading5(),
          p: AppStyles.paragraph1Regular(),
          a: AppStyles.label1Bold(),
          textAlign: WrapAlignment.spaceBetween),
    );
  }
}
