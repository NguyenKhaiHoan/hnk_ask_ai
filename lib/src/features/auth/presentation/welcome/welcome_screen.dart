import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

import '../../../../../gen/fonts.gen.dart';
import '../../../../core/common/widgets/auth_buttons.dart';
import '../../../../core/constants/constant.dart';

part 'widgets/animated_text.dart';
part 'widgets/bottom_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.light,
      body: Stack(
        children: [
          AnimatedTexts(),
          BottomButtons(),
        ],
      ),
    );
  }
}
