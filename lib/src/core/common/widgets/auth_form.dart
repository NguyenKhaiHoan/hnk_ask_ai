import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_button.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/enums/button_type.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

class AuthForm extends StatelessWidget {
  final bool isAuth;
  final TextEditingController text1Controller;
  final TextEditingController text2Controller;
  final FocusNode focusNode1;
  final FocusNode focusNode2;
  final String? hintText1;
  final String? hintText2;
  final String buttonText;
  final VoidCallback onSubmitPressed;
  final String promptText;
  final String actionText;
  final VoidCallback onActionTextPressed;

  const AuthForm({
    super.key,
    required this.isAuth,
    required this.text1Controller,
    required this.text2Controller,
    this.hintText1,
    this.hintText2,
    required this.focusNode1,
    required this.focusNode2,
    required this.buttonText,
    required this.onSubmitPressed,
    required this.promptText,
    required this.actionText,
    required this.onActionTextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            textController: text1Controller,
            focusNode: focusNode1,
            onChanged: (value) {},
            hintText: hintText1 ?? 'Email address'.hardcoded,
            onSubmited: (value) {},
          ),
          gapH24,
          CustomTextFormField(
            textController: text2Controller,
            focusNode: focusNode2,
            onChanged: (value) {},
            hintText: hintText2 ?? 'Password'.hardcoded,
            onSubmited: (value) {},
          ),
          gapH24,
          CustomButton(
            text: buttonText,
            textColor: AppColors.light,
            buttonType: ButtonType.elevated,
            backgroundColor: AppColors.dark,
            onPressed: onSubmitPressed,
          ),
          gapH16,
          if (isAuth)
            GestureDetector(
              onTap: onActionTextPressed,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: promptText,
                      style: AppStyles.paragraph2Regular(),
                    ),
                    TextSpan(
                      text: ' $actionText',
                      style: AppStyles.paragraph2Bold(),
                    ),
                  ],
                ),
              ),
            )
          else
            GestureDetector(
              onTap: onActionTextPressed,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: promptText
                          .substring(0, promptText.indexOf("Terms"))
                          .trim(),
                      style: AppStyles.paragraph2Regular(),
                    ),
                    TextSpan(
                      text: ' $actionText ',
                      style: AppStyles.paragraph2Bold(),
                    ),
                    TextSpan(
                      text: promptText
                          .substring(
                              promptText.indexOf("Terms") + "Terms".length)
                          .trim(),
                      style: AppStyles.paragraph2Regular(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
