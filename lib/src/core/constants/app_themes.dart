part of 'constant.dart';

class AppThemes {
  const AppThemes._();

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.light,
      applyElevationOverlayColor: false,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.light,
          elevation: 0.0,
          titleTextStyle:
              AppStyles.heading3().copyWith(color: AppColors.dark)));
}
