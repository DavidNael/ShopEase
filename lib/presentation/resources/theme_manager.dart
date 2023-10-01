import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shopease/presentation/resources/shared_preference_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

abstract class ThemeManager {
  static bool isDark =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
  static Future<bool> isDarkMode() async {
    bool? isDarkMode = await SharedPreferenceManager.isDarkMode;
    isDarkMode ??=
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return isDarkMode;
  }

  static ThemeData getInitialTheme() {
    bool isDarkMode =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return getApplicationTheme(isDarkMode: isDarkMode);
  }

  static Future<ThemeData> getCurrentTheme() async {
    return getApplicationTheme(isDarkMode: await isDarkMode());
  }

  static ThemeData getApplicationTheme({required bool isDarkMode}) {
    if (isDarkMode) {
      return ThemeData(
        primaryColor: ColorManager.darkPrimary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.darkGrey,
        splashColor: ColorManager.darkGrey.withOpacity(0.5),
        scaffoldBackgroundColor: ColorManager.darkBackground,
        canvasColor: ColorManager.darkBackground,
        // 1 Card Theme
        cardTheme: const CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.darkGrey,
          elevation: AppSize.s4,
        ),

        // 2 App bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.darkBackground,
          centerTitle: true,
          elevation: AppSize.s0,
          shadowColor: ColorManager.darkGrey,
          titleTextStyle: getRegularTextStyle(
            fontSize: FontSize.s34,
            color: ColorManager.darkWhite,
          ),
          actionsIconTheme: const IconThemeData(
            color: ColorManager.darkWhite,
          ),
          iconTheme: const IconThemeData(
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
            textStyle: getMediumTextStyle(
              fontSize: FontSize.s14,
              color: ColorManager.darkWhiteSecondary,
            ),
            splashFactory: InkSplash.splashFactory,
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
          titleMedium: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.darkWhiteSecondary,
          ),
          titleSmall: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.darkGrey,
          ),
          labelSmall: getRegularTextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.lightGrey,
            decoration: TextDecoration.lineThrough,
            decorationColor: ColorManager.lightGrey,
            decorationThickness: AppSize.s3,
          ),
        ),

        // 6 Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.darkBlack,

          contentPadding: const EdgeInsets.all(AppPadding.p8),

          hintStyle: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.darkGrey,
          ),

          labelStyle: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.darkGrey,
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

        // 7 Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.darkBackground,
          selectedItemColor: ColorManager.darkPrimary,
          unselectedItemColor: ColorManager.darkGrey,
          selectedLabelStyle: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.darkPrimary,
          ),
          showUnselectedLabels: true,
          elevation: AppSize.s1,
          unselectedLabelStyle: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.darkGrey,
          ),
        ),

        // 8 text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.darkWhite,
          ),
        ),

        // 9 checkbox theme
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(ColorManager.darkPrimary),
          checkColor: MaterialStateProperty.all(ColorManager.darkWhite),
          overlayColor: MaterialStateProperty.all(ColorManager.darkPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),

        // 10 floating action button theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorManager.darkPrimary,
        ),
      );
    } else {
      return ThemeData(
        primaryColor: ColorManager.lightPrimary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.lightGrey,
        splashColor: ColorManager.lightWhite.withOpacity(0.5),
        scaffoldBackgroundColor: ColorManager.lightBackground,
        canvasColor: ColorManager.lightBackground,

        // 1 Card Theme
        cardTheme: const CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.lightGrey,
          elevation: AppSize.s4,
        ),

        // 2 App bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.lightBackground,
          centerTitle: true,
          elevation: AppSize.s0,
          shadowColor: ColorManager.lightGrey,
          titleTextStyle: getRegularTextStyle(
            fontSize: FontSize.s34,
            color: ColorManager.lightBlack,
          ),
          actionsIconTheme: const IconThemeData(
            color: ColorManager.lightBlack,
          ),
          iconTheme: const IconThemeData(
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
            foregroundColor: ColorManager.darkWhiteSecondary,
            textStyle: getMediumTextStyle(
              fontSize: FontSize.s18,
              color: ColorManager.white,
            ),
            splashFactory: InkSplash.splashFactory,
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
          titleMedium: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.lightFormText,
          ),
          titleSmall: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.lightGrey,
          ),
          labelSmall: getRegularTextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.lightGrey,
            decoration: TextDecoration.lineThrough,
            decorationColor: ColorManager.lightGrey,
            decorationThickness: AppSize.s3,
          ),
        ),

        // 6 Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.lightWhite,
          contentPadding: const EdgeInsets.all(AppPadding.p8),

          hintStyle: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.lightGrey,
          ),

          labelStyle: getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.lightGrey,
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

        // 7 Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.lightBackground,
          selectedItemColor: ColorManager.lightPrimary,
          unselectedItemColor: ColorManager.lightGrey,
          selectedLabelStyle: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.lightPrimary,
          ),
          showUnselectedLabels: true,
          elevation: AppSize.s1,
          unselectedLabelStyle: getRegularTextStyle(
            fontSize: FontSize.s11,
            color: ColorManager.lightGrey,
          ),
        ),

        // 8 text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.lightBlack,
          ),
        ),
        // 9 checkbox theme
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(ColorManager.lightPrimary),
          checkColor: MaterialStateProperty.all(ColorManager.lightWhite),
          overlayColor: MaterialStateProperty.all(ColorManager.lightPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),

        // 10 floating action button theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorManager.lightPrimary,
        ),
      );
    }
  }
}
