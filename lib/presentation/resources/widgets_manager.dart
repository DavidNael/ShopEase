import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

import 'color_manager.dart';

abstract class WidgetsManager {
  static Widget outlinedElevatedButton({
    required BuildContext context,
    required Widget child,
    VoidCallback? onPressed,
    Color borderColor = ColorManager.lightPrimary,
    Color backgroundColor = ColorManager.lightWhite,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    double borderWidth = AppSize.s1,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
                borderRadius: borderRadius ??=
                    BorderRadius.circular(AppSize.s25),
              ),
            ),
            padding: MaterialStateProperty.all(padding ??= EdgeInsets.zero),
          ),
      child: child,
    );
  }
}
