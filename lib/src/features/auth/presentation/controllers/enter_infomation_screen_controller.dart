import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/features/auth/application/auth_service.dart';

import '../../../../core/exceptions/failure.dart';

class EnterInfomationScreenController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  TextEditingController lastNameTextController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  final authService = Get.find<AuthService>();

  @override
  void dispose() {
    firstNameTextController.dispose();
    firstNameFocusNode.dispose();
    lastNameTextController.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  Future<void> enterInfomation(BuildContext context) async {
    try {
      await authService.enterInformation(
        firstName: firstNameTextController.text.trim(),
        lastName: lastNameTextController.text.trim(),
      );
      if (!context.mounted) return;
      context.goNamed('chat');
    } catch (e) {
      throw (Failure(message: e.toString()));
    }
  }
}
