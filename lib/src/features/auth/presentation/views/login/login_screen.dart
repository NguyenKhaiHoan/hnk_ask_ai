import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/login_screen_controller.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
        title: 'Welcome back'.hardcoded,
        text1Controller: controller.emailTextController,
        focusNode1: controller.emailFocusNode,
        text2Controller: controller.passwordTextController,
        focusNode2: controller.passwordFocusNode,
        buttonText: 'Continue'.hardcoded,
        onSubmitPressed: () => controller.login(context),
        promptText: 'Don\'t have an account?'.hardcoded,
        actionText: 'Sign up'.hardcoded,
        onActionTextPressed: () => context.goNamed('signUp'));
  }
}
