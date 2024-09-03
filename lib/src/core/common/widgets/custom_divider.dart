import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(
          child: Divider(
        color: AppColors.tuatara,
        height: 1,
      )),
      gapW24,
      Text(" OR "),
      gapW24,
      Expanded(
          child: Divider(
        color: AppColors.tuatara,
        height: 1,
      )),
    ]);
  }
}
