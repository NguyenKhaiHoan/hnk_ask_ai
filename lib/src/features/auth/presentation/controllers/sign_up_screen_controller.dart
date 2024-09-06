import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/features/auth/application/auth_service.dart';

import '../../../../core/exceptions/failure.dart';

class SignUpScreenController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  final authService = Get.find<AuthService>();

  @override
  void dispose() {
    emailTextController.dispose();
    emailFocusNode.dispose();
    passwordTextController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> signUp(BuildContext context) async {
    try {
      await authService.signUp(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );
      if (!context.mounted) return;
      context.goNamed('enterInfomation');
    } catch (e) {
      throw (Failure(message: e.toString()));
    }
  }
}
