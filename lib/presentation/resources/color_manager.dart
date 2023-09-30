import 'package:flutter/material.dart';

abstract class ColorManager {
  /// Common Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  /// Light Theme Colors
  static const Color lightBlack = Color(0xFF222222);
  static const Color lightGrey = Color(0xFF9b9b9b);
  static const Color lightPrimary = Color(0xFFdb3022);
  static const Color lightBackground = Color(0xFFf9f9f9);
  static const Color lightFormText = Color(0xFF2D2D2D);
  static const Color lightWhite = Color(0xFFFFFFFF);
  static const Color lightError = Color(0xFFf01f0e);
  static const Color lightSuccess = Color(0xFF2aa952);

  /// Dark Theme Colors
  static const Color darkWhiteSecondary = Color(0xFFF5F5F5);
  static const Color darkWhite = Color(0xFFf6f6f6);
  static const Color darkGrey = Color(0xFFabb4bd);
  static const Color darkPrimary = Color(0xFFef3651);
  static const Color darkBackground = Color(0xFF1e1f28);
  static const Color darkBlack = Color(0xFF2a2c36);
  static const Color darkSales = Color(0xFFff3e3e);
  static const Color darkError = Color(0xFFff2424);
  static const Color darkSuccess = Color(0xFF55d85a);
}
