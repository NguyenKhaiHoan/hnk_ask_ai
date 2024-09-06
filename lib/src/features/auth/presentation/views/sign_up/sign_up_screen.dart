import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/sign_up_screen_controller.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
        title: 'Create your account'.hardcoded,
        description:
            'Please note that phone verification is required for signup. Your number will only be used to verify your identity for security purposes.'
                .hardcoded,
        text1Controller: controller.emailTextController,
        focusNode1: controller.emailFocusNode,
        text2Controller: controller.passwordTextController,
        focusNode2: controller.passwordFocusNode,
        buttonText: 'Continue'.hardcoded,
        onSubmitPressed: () => controller.signUp(context),
        promptText: 'Already have an account?'.hardcoded,
        actionText: 'Login'.hardcoded,
        onActionTextPressed: () => context.goNamed('login'));
  }
}
