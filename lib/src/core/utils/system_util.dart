import 'package:flutter/services.dart';

import '../constants/constant.dart';

class SystemUtil {
  const SystemUtil._();

  static void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
