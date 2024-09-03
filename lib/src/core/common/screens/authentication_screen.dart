import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/authentication_form.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/text_logo.dart';
import 'package:hnk_ask_ai/src/core/enums/button_type.dart';

import '../../constants/constant.dart';
import '../widgets/authentication_buttons.dart';
import '../widgets/custom_divider.dart';

class AuthenticationScreen extends StatelessWidget {
  final bool? isAuthentication;
  final String title;
  final String? description;
  final TextEditingController text1Controller;
  final FocusNode focusNode1;
  final TextEditingController text2Controller;
  final FocusNode focusNode2;
  final String? hintText1;
  final String? hintText2;
  final String buttonText;
  final VoidCallback onSubmitPressed;
  final String promptText;
  final String actionText;
  final VoidCallback onActionTextPressed;

  const AuthenticationScreen({
    super.key,
    this.isAuthentication,
    required this.title,
    this.description,
    required this.text1Controller,
    required this.focusNode1,
    required this.text2Controller,
    required this.focusNode2,
    this.hintText1,
    this.hintText2,
    required this.buttonText,
    required this.onSubmitPressed,
    required this.promptText,
    required this.actionText,
    required this.onActionTextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: defaultSmallPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH64,
            const TextLogo(),
            gapH24,
            Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: AppStyles.heading2(),
                    ),
                    if (description != null) gapH16,
                    if (description != null)
                      Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: AppStyles.paragraph2Regular()
                            .copyWith(color: AppColors.shipGray),
                      ),
                    gapH32,
                    AuthenticationForm(
                      isAuthentication: isAuthentication ?? true,
                      text1Controller: text1Controller,
                      text2Controller: text2Controller,
                      focusNode1: focusNode1,
                      focusNode2: focusNode2,
                      hintText1: hintText1,
                      hintText2: hintText2,
                      buttonText: buttonText,
                      onSubmitPressed: onSubmitPressed,
                      promptText: promptText,
                      actionText: actionText,
                      onActionTextPressed: onActionTextPressed,
                    ),
                  ],
                ),
                if ((isAuthentication ?? true)) gapH32,
                if ((isAuthentication ?? true)) const CustomDivider(),
                if ((isAuthentication ?? true)) gapH24,
                if ((isAuthentication ?? true))
                  const AuthenticationButtons(
                    hasOnlySocialButton: true,
                    textColor: AppColors.dark,
                    backgroundColor: AppColors.light,
                    type: ButtonType.outlined,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
