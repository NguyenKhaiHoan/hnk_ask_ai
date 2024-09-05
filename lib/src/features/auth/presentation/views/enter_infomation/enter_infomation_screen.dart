import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

import '../../../../../core/config/config.dart';
import '../../../../../core/exceptions/failure.dart';

class EnterInfomationScreen extends StatefulWidget {
  const EnterInfomationScreen({super.key});

  @override
  State<EnterInfomationScreen> createState() => _EnterInfomationScreenState();
}

class _EnterInfomationScreenState extends State<EnterInfomationScreen> {
  late TextEditingController _firstNameTextController;
  late FocusNode _firstNameFocusNode;
  late TextEditingController _lastNameTextController;
  late FocusNode _lastNameFocusNode;

  @override
  void initState() {
    super.initState();
    _firstNameTextController = TextEditingController();
    _firstNameFocusNode = FocusNode();
    _lastNameTextController = TextEditingController();
    _lastNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameTextController.dispose();
    _lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AuthScreen(
            isAuth: false,
            title: 'Tell us about you'.hardcoded,
            text1Controller: _firstNameTextController,
            focusNode1: _firstNameFocusNode,
            text2Controller: _lastNameTextController,
            focusNode2: _lastNameFocusNode,
            hintText1: 'First Name'.hardcoded,
            hintText2: 'Last Name'.hardcoded,
            buttonText: 'Continue'.hardcoded,
            onSubmitPressed: () => enterInfomation(context, ref),
            promptText:
                'By clicking "Continue" you agree to our Terms and confirm you\'re 18 years or older.'
                    .hardcoded,
            actionText: 'Terms'.hardcoded,
            onActionTextPressed: () {});
      },
    );
  }

  Future<void> enterInfomation(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authServiceProvider).enterInformation(
            firstName: _firstNameTextController.text.trim(),
            lastName: _lastNameTextController.text.trim(),
          );
      if (!context.mounted) return;
      context.goNamed('chat');
    } catch (e) {
      throw (Failure(message: e.toString()));
    }
  }
}
