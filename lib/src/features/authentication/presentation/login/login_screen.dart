import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/screens/authentication_screen.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return AuthenticationScreen(
        title: 'Welcome back'.hardcoded,
        text1Controller: _emailTextController,
        focusNode1: _emailFocusNode,
        text2Controller: _passwordTextController,
        focusNode2: _passwordFocusNode,
        buttonText: 'Continue'.hardcoded,
        onSubmitPressed: () => context.goNamed('chat'),
        promptText: 'Don\'t have an account?'.hardcoded,
        actionText: 'Sign up'.hardcoded,
        onActionTextPressed: () => context.goNamed('signUp'));
  }
}
