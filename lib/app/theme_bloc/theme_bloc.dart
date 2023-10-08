import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/app/theme_bloc/theme_event.dart';
import 'package:shopease/presentation/resources/shared_preference_manager.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeManager.getInitialTheme()) {
    on<GetThemeEvent>((event, emit) async {
      final isDarkMode = await ThemeManager.isDarkMode();
      emit(ThemeManager.getApplicationTheme(isDarkMode: isDarkMode));
    });
    on<ThemeChangeEvent>((event, emit) async {
      final isDarkMode = await ThemeManager.isDarkMode();
      SharedPrefManager.setDarkMode(!isDarkMode);
      ThemeManager.isDark = !isDarkMode;
      emit(ThemeManager.getApplicationTheme(isDarkMode: !isDarkMode));
    });
  }
}
