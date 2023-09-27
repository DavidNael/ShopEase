import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme({required bool isDark}) {
  if (isDark) {
    return ThemeData(
      primaryColor: ColorManager.darkPrimary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.darkGrey,
      splashColor: ColorManager.darkGrey,

      // 1 Card Theme
      cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.darkGrey,
        elevation: AppSize.s4,
      ),

      // 2 App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.darkBackground,
        elevation: AppSize.s0,
        shadowColor: ColorManager.darkGrey,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSize.s34,
          color: ColorManager.darkWhite,
        ),
      ),

      // 3 Button theme
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.darkGrey,
        buttonColor: ColorManager.darkPrimary,
        splashColor: ColorManager.lightPrimary,
        
      ),

      // 4 Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
              fontSize: FontSize.s17, color: ColorManager.white),
          backgroundColor: ColorManager.darkPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
        ),
      ),

      // 5 Text theme
      textTheme: TextTheme(
        displayLarge: getBoldTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s34,
        ),
        displayMedium: getSemiBoldTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s24,
        ),
        displaySmall: getRegularTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s18,
        ),
        bodyLarge: getSemiBoldTextStyle(
          fontSize: FontSize.s16,
          color: ColorManager.darkWhite,
        ),
        bodyMedium: getRegularTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s16,
        ),
        bodySmall: getMediumTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s14,
        ),
        titleLarge: getRegularTextStyle(
          color: ColorManager.darkWhite,
          fontSize: FontSize.s14,
        ),
        titleMedium: getRegularTextStyle(
          fontSize: FontSize.s11,
          color: ColorManager.darkGrey,
        ),
      ),

      // 6 Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        hintStyle: getMediumTextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.darkGrey,
        ),

        labelStyle: getMediumTextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.darkWhite,
        ),

        errorStyle: getRegularTextStyle(
          fontSize: FontSize.s11,
          color: ColorManager.darkError,
        ),

        // Enabled border
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.darkGrey,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // Focused border
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.darkBackground,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // Error border
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.darkError,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // Focused error border
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.darkError,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
    );
  } else {
    return ThemeData(
      primaryColor: ColorManager.lightPrimary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.lightGrey,
      splashColor: ColorManager.lightGrey,

      // 1 Card Theme
      cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.lightGrey,
        elevation: AppSize.s4,
      ),
      
      // 2 App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.lightBackground,
        elevation: AppSize.s0,
        shadowColor: ColorManager.lightGrey,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSize.s34,
          color: ColorManager.lightBlack,
        ),
      ),

      // 3 Button theme
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.lightGrey,
        buttonColor: ColorManager.lightPrimary,
        splashColor: ColorManager.darkPrimary,
      ),

      // 4 Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
              fontSize: FontSize.s17, color: ColorManager.white),
          backgroundColor: ColorManager.lightPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
        ),
      ),

      // 5 Text theme
      textTheme: TextTheme(
        displayLarge: getBoldTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s34,
        ),
        displayMedium: getSemiBoldTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s24,
        ),
        displaySmall: getRegularTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s18,
        ),
        bodyLarge: getSemiBoldTextStyle(
          fontSize: FontSize.s16,
          color: ColorManager.lightBlack,
        ),
        bodyMedium: getRegularTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s16,
        ),
        bodySmall: getMediumTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s14,
        ),
        titleLarge: getRegularTextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s14,
        ),
        titleMedium: getRegularTextStyle(
          fontSize: FontSize.s11,
          color: ColorManager.lightGrey,
        ),
      ),

      // 6 Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        hintStyle: getMediumTextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.lightGrey,
        ),

        labelStyle: getMediumTextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.lightBlack,
        ),

        errorStyle: getRegularTextStyle(
          fontSize: FontSize.s11,
          color: ColorManager.lightError,
        ),

        // Enabled border
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightGrey,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // Focused border
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightBackground,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // Error border
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightError,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // Focused error border
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.lightError,
            width: AppSize.s1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
    );
  }
}
