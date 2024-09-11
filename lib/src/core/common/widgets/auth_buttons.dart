import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/gen/assets.gen.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_button.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/enums/button_type.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/auth_controller.dart';

class AuthButtons extends StatelessWidget {
  final bool hasOnlySocialButton;
  final bool isOutlinedButton;
  final ButtonType? type;
  final Color? backgroundColor;
  final Color? textColor;

  const AuthButtons({
    super.key,
    this.hasOnlySocialButton = false,
    this.isOutlinedButton = false,
    this.type,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppleButton(
          textColor: textColor,
          backgroundColor: backgroundColor,
          type: type,
        ),
        gapH12,
        GoogleButton(
          textColor: textColor,
          backgroundColor: backgroundColor,
          type: type,
        ),
        if (!hasOnlySocialButton) gapH12,
        if (!hasOnlySocialButton) const EmailSignUpButton(),
        if (!hasOnlySocialButton) gapH12,
        if (!hasOnlySocialButton) const LoginButton(),
      ],
    );
  }
}

class AppleButton extends StatelessWidget {
  final ButtonType? type;
  final Color? backgroundColor;
  final Color? textColor;

  const AppleButton(
      {super.key, this.textColor, this.type, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Continue with Apple'.hardcoded,
      iconPath: Assets.images.apple.path,
      backgroundColor: backgroundColor ?? AppColors.light,
      iconSize: 14,
      colorFilter: const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
      textColor: textColor ?? AppColors.dark,
      buttonType: type ?? ButtonType.elevated,
    );
  }
}

class GoogleButton extends StatelessWidget {
  final ButtonType? type;
  final Color? backgroundColor;
  final Color? textColor;

  const GoogleButton(
      {super.key, this.textColor, this.type, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Continue with Google'.hardcoded,
      textColor: textColor ?? AppColors.light,
      iconPath: Assets.images.google.path,
      backgroundColor: backgroundColor ?? AppColors.grey,
      iconSize: 16,
      notNeedColorFilter: true,
      buttonType: type ?? ButtonType.elevated,
      onPressed: () => context.read<AuthController>().signInWithGoogle(),
    );
  }
}

class EmailSignUpButton extends StatelessWidget {
  const EmailSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Sign up with email'.hardcoded,
      textColor: AppColors.light,
      iconPath: Assets.images.emailFill.path,
      backgroundColor: AppColors.grey,
      iconSize: 20,
      colorFilter: const ColorFilter.mode(AppColors.light, BlendMode.srcIn),
      buttonType: ButtonType.elevated,
      onPressed: () => context.pushNamed('signUp'),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Login'.hardcoded,
      textColor: AppColors.light,
      backgroundColor: AppColors.light,
      buttonType: ButtonType.outlined,
      onPressed: () => context.pushNamed('login'),
    );
  }
}
