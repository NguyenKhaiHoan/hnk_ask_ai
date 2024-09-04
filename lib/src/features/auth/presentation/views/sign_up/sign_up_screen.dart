import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/config/config.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailTextController;
  late FocusNode _emailFocusNode;
  late TextEditingController _passwordTextController;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordTextController = TextEditingController();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _emailFocusNode.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AuthScreen(
            title: 'Create your account'.hardcoded,
            description:
                'Please note that phone verification is required for signup. Your number will only be used to verify your identity for security purposes.'
                    .hardcoded,
            text1Controller: _emailTextController,
            focusNode1: _emailFocusNode,
            text2Controller: _passwordTextController,
            focusNode2: _passwordFocusNode,
            buttonText: 'Continue'.hardcoded,
            onSubmitPressed: () => signUp(context, ref),
            promptText: 'Already have an account?'.hardcoded,
            actionText: 'Login'.hardcoded,
            onActionTextPressed: () => context.goNamed('login'));
      },
    );
  }

  Future<void> signUp(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authServiceProvider).signUp(
            email: _emailTextController.text.trim(),
            password: _passwordTextController.text.trim(),
          );
      if (!context.mounted) return;
      context.goNamed('enterInfomation');
    } catch (e) {
      print(e.toString());
    }
  }
}
