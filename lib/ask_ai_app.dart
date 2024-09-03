import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/routes/app_routes.dart';

import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskAiApp extends StatelessWidget {
  const AskAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ch) => DismissKeyboard(
        child: MaterialApp.router(
          title: 'AskAI',
          theme: AppThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.routers,
        ),
      ),
    );
  }
}
