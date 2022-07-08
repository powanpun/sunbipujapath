import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/color_manager.dart';

class CustomTextTheme extends TextTheme {
  // Use for app bar title
  @override
  TextStyle? get headline3 => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primary,
      );

  // Use for title
  @override
  TextStyle? get headline4 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      );

  // Use for sub title
  @override
  TextStyle? get headline5 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.lightBlack,
      );

  // Use for names in profile
  @override
  TextStyle? get headline6 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      );

  // Use for subtitle with black text color
  @override
  TextStyle? get subtitle1 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.black,
      );

  // Use for subtitle with grey text color
  @override
  TextStyle? get subtitle2 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.lightBlack,
      );

  // Use for body text with black text color
  @override
  TextStyle? get bodyText1 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      );

  // Use for body text with grey text color
  @override
  TextStyle? get bodyText2 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.lightBlack,
      );

  // Use for button
  @override
  TextStyle? get button => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.white,
      );
}
