import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shopease/presentation/resources/shared_preference_manager.dart';

import 'assets_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  final SharedPrefManager _sharedPrefs;
  ThemeManager(this._sharedPrefs);
  bool get isDarkMode {
    bool? isDarkMode = _sharedPrefs.isDarkMode;
    isDarkMode ??=
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return isDarkMode;
  }

  ThemeData switchCurrentTheme() {
    _sharedPrefs.setDarkMode(!isDarkMode);
    return getApplicationTheme();
  }

  ThemeData getApplicationTheme({bool? dark}) {
    if (dark ?? isDarkMode) {
      /// Returns the dark theme
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
      return ThemeData(
        primaryColor: ColorManager.darkPrimary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.darkGrey,
        splashColor: ColorManager.darkGrey.withOpacity(0.5),
        scaffoldBackgroundColor: ColorManager.darkBackground,
        canvasColor: ColorManager.darkBackground,
        cardColor: ColorManager.black,
        colorScheme: const ColorScheme.dark(
          primary: ColorManager.darkPrimary,
          secondary: ColorManager.darkPrimary,
          surface: ColorManager.darkBackground,
          background: ColorManager.darkBackground,
          error: ColorManager.darkError,
          onPrimary: ColorManager.darkWhite,
          onSecondary: ColorManager.darkWhite,
          onSurface: ColorManager.darkWhite,
          onBackground: ColorManager.darkWhite,
          onError: ColorManager.darkWhite,
        ),
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
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              getMediumTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.white,
              ),
            ),
            splashFactory: InkSplash.splashFactory,
            backgroundColor:
                MaterialStateProperty.all(ColorManager.darkPrimary),
            overlayColor: MaterialStateProperty.all(
              ColorManager.darkGrey.withOpacity(0.4),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
              ),
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
          labelMedium: getSemiBoldTextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.white,
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

        // 11 Icon theme
        iconTheme: const IconThemeData(
          color: ColorManager.darkWhite,
        ),
        // 00 Extension
        extensions: const [
          CustomThemeExtension(
            homeIconActive: ImageAssets.homeActiveDarkIcon,
            shopIconActive: ImageAssets.shopActiveDarkIcon,
            bagIconActive: ImageAssets.bagActiveDarkIcon,
            heartIconActive: ImageAssets.heartActiveDarkIcon,
            profileIconActive: ImageAssets.profileActiveDarkIcon,
            salesColor: ColorManager.darkSales,
            complementaryColor: ColorManager.white,
            themeIcon: Icons.dark_mode,
          )
        ],
      );
    } else {
      /// Returns the light theme
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
      return ThemeData(
        primaryColor: ColorManager.lightPrimary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.lightGrey,
        splashColor: ColorManager.lightWhite.withOpacity(0.5),
        scaffoldBackgroundColor: ColorManager.lightBackground,
        canvasColor: ColorManager.lightBackground,
        cardColor: ColorManager.white,
        colorScheme: const ColorScheme.light(
          primary: ColorManager.lightPrimary,
          secondary: ColorManager.lightPrimary,
          surface: ColorManager.lightBackground,
          background: ColorManager.lightBackground,
          error: ColorManager.lightError,
          onPrimary: ColorManager.lightBlack,
          onSecondary: ColorManager.lightBlack,
          onSurface: ColorManager.lightBlack,
          onBackground: ColorManager.lightBlack,
          onError: ColorManager.lightBlack,
        ),
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
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              getMediumTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.white,
              ),
            ),
            splashFactory: InkSplash.splashFactory,
            backgroundColor:
                MaterialStateProperty.all(ColorManager.lightPrimary),
            overlayColor: MaterialStateProperty.all(
              ColorManager.lightGrey.withOpacity(0.4),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
              ),
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
          labelMedium: getSemiBoldTextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.black,
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

        // 11 Icon theme
        iconTheme: const IconThemeData(
          color: ColorManager.lightBlack,
        ),

        // 12 outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: ColorManager.lightBlack,
            backgroundColor: ColorManager.lightPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s25),
            ),
            side: const BorderSide(
              color: ColorManager.lightPrimary,
              width: AppSize.s1,
            ),
          ),
        ),

        // 00 Extension
        extensions: const [
          CustomThemeExtension(
            homeIconActive: ImageAssets.homeActiveLightIcon,
            shopIconActive: ImageAssets.shopActiveLightIcon,
            bagIconActive: ImageAssets.bagActiveLightIcon,
            heartIconActive: ImageAssets.heartActiveLightIcon,
            profileIconActive: ImageAssets.profileActiveLightIcon,
            salesColor: ColorManager.lightSales,
            complementaryColor: ColorManager.black,
            themeIcon: Icons.light_mode,
          )
        ],
      );
    }
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final String homeIconActive;
  final String shopIconActive;
  final String bagIconActive;
  final String heartIconActive;
  final String profileIconActive;
  final Color salesColor;
  final Color complementaryColor;
  final IconData themeIcon;

  const CustomThemeExtension({
    required this.homeIconActive,
    required this.shopIconActive,
    required this.bagIconActive,
    required this.heartIconActive,
    required this.profileIconActive,
    required this.salesColor,
    required this.complementaryColor,
    required this.themeIcon,
  });

  @override
  CustomThemeExtension copyWith({
    String? homeIconActive,
    String? shopIconActive,
    String? bagIconActive,
    String? heartIconActive,
    String? profileIconActive,
    Color? salesColor,
    Color? complementaryColor,
    IconData? themeIcon,
  }) {
    return CustomThemeExtension(
      homeIconActive: homeIconActive ?? this.homeIconActive,
      shopIconActive: shopIconActive ?? this.shopIconActive,
      bagIconActive: bagIconActive ?? this.bagIconActive,
      heartIconActive: heartIconActive ?? this.heartIconActive,
      profileIconActive: profileIconActive ?? this.profileIconActive,
      salesColor: salesColor ?? this.salesColor,
      complementaryColor: complementaryColor ?? this.complementaryColor,
      themeIcon: themeIcon ?? this.themeIcon,
    );
  }

  @override
  CustomThemeExtension lerp(covariant CustomThemeExtension? other, double t) {
    return this;
  }
}
