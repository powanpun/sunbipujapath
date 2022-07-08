import 'package:flutter/material.dart';
import 'package:puja_path/utils/custom_text_theme.dart';
import 'package:puja_path/utils/styles_manager.dart';
import 'package:puja_path/utils/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      scaffoldBackgroundColor: ColorManager.backgroundColor,
      dividerColor: ColorManager.dividerColor,
      // ripple color
      splashColor: ColorManager.primaryOpacity70,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorManager.black),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorManager.primary)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      // Text theme
      textTheme: CustomTextTheme(),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ),

      //Tab bar theme
      tabBarTheme: TabBarTheme(
          labelColor: ColorManager.black,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.0,color: ColorManager.primary),
              insets: EdgeInsets.symmetric(horizontal: AppSize.s16))));
}
