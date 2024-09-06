import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/enter_infomation_screen_controller.dart';

class EnterInfomationScreen extends GetView<EnterInfomationScreenController> {
  const EnterInfomationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
        isAuth: false,
        title: 'Tell us about you'.hardcoded,
        text1Controller: controller.firstNameTextController,
        focusNode1: controller.firstNameFocusNode,
        text2Controller: controller.lastNameTextController,
        focusNode2: controller.lastNameFocusNode,
        hintText1: 'First Name'.hardcoded,
        hintText2: 'Last Name'.hardcoded,
        buttonText: 'Continue'.hardcoded,
        onSubmitPressed: () => controller.enterInfomation(context),
        promptText:
            'By clicking "Continue" you agree to our Terms and confirm you\'re 18 years or older.'
                .hardcoded,
        actionText: 'Terms'.hardcoded,
        onActionTextPressed: () {});
  }
}
