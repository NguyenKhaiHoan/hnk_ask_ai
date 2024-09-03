import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void scrollToBottom({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
  }) {
    animateTo(
      position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }
}
