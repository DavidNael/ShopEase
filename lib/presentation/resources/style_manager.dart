import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w500,
  required Color color,
  String? fontFamily,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily ?? FontConstants.metropolis,
    fontWeight: fontWeight,
    color: color,
  );
}

// Regular Style
TextStyle getRegularTextStyle(
    {required double fontSize, required Color color, String? fontFamily}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
    fontFamily: fontFamily,
  );
}

// Medium Style
TextStyle getMediumTextStyle(
    {required double fontSize, required Color color, String? fontFamily}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
    fontFamily: fontFamily,
  );
}

// Light Style
TextStyle getLightTextStyle(
    {required double fontSize, required Color color, String? fontFamily}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
    fontFamily: fontFamily,
  );
}

// Bold Style
TextStyle getBoldTextStyle(
    {required double fontSize, required Color color, String? fontFamily}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
    fontFamily: fontFamily,
  );
}

// SemiBold Style
TextStyle getSemiBoldTextStyle(
    {required double fontSize, required Color color, String? fontFamily}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
    fontFamily: fontFamily,
  );
}
