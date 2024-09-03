part of 'constant.dart';

mixin Font {
  static FontWeight get r => FontWeight.w400;
  static FontWeight get m => FontWeight.w500;
  static FontWeight get b => FontWeight.w700;
}

class AppStyles {
  const AppStyles._();

  static TextStyle heading1() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 42.sp,
        fontWeight: Font.b,
      );

  static TextStyle heading2() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 24.sp,
        fontWeight: Font.b,
      );

  static TextStyle heading3() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 18.sp,
        fontWeight: Font.b,
      );

  static TextStyle heading4() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: Font.b,
      );

  static TextStyle heading5() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: Font.b,
      );

  static TextStyle paragraph1Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: Font.m,
      );

  static TextStyle paragraph1Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: Font.r,
      );

  static TextStyle paragraph2Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: Font.m,
      );

  static TextStyle paragraph2Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: Font.r,
      );

  static TextStyle paragraph3Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 12.sp,
        fontWeight: Font.m,
      );

  static TextStyle paragraph3Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 12.sp,
        fontWeight: Font.r,
      );

  static TextStyle label1Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 20.sp,
        fontWeight: Font.m,
      );

  static TextStyle label1Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 20.sp,
        fontWeight: Font.r,
      );

  static TextStyle label2Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: Font.m,
      );

  static TextStyle label2Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: Font.r,
      );

  static TextStyle label3Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: Font.m,
      );

  static TextStyle label3Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: Font.r,
      );

  static TextStyle label4Bold() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 12.sp,
        fontWeight: Font.m,
      );

  static TextStyle label4Regular() => TextStyle(
        fontStyle: FontStyle.normal,
        fontFamily: FontFamily.sf,
        color: AppColors.dark,
        fontSize: 12.sp,
        fontWeight: Font.r,
      );
}
