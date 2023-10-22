import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/app/theme_bloc/theme_event.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final ThemeManager _themeManager;
  ThemeBloc(this._themeManager) : super(_themeManager.getApplicationTheme()) {

    on<ThemeChangeEvent>((event, emit) async {
      emit(_themeManager.switchCurrentTheme());
    });
  }
}
