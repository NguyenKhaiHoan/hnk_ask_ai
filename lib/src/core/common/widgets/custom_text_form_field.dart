import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextFormField(
      {super.key,
      required this.textController,
      required this.focusNode,
      required this.onChanged,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onChanged: (value) => onChanged,
      decoration: InputDecoration(
        suffix: suffixIcon,
        prefix: prefixIcon,
        hintText: hintText,
        hintStyle:
            AppStyles.paragraph1Regular().copyWith(color: AppColors.masala),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.mercury),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.mercury),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.mercury),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}
