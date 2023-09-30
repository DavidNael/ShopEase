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

  static Widget textFormField({
    EdgeInsetsGeometry? padding = const EdgeInsets.all(AppSize.s10),
    EdgeInsetsGeometry? margin,
    double? height = AppSize.s70,
    double? width,
    BorderRadiusGeometry? borderRadius,
    Color? color,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    TextEditingController? controller,
    bool obscureText = false,
    bool readOnly = false,
    bool enabled = true,
    InputBorder border = InputBorder.none,
    InputBorder enabledBorder = InputBorder.none,
    InputBorder focusedBorder = InputBorder.none,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ??= BorderRadius.circular(AppSize.s4),
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlack.withOpacity(0.1),
              blurRadius: AppSize.s10,
              offset: const Offset(0, AppSize.s5),
            ),
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          errorText: errorText,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }
}
