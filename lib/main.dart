import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'ask_ai_app.dart';

Future<void> main() async {
  await DependencyInjection.init();
  runApp(const ProviderScope(child: AskAiApp()));
}
