import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/app/theme_bloc/theme_bloc.dart';
import 'package:shopease/app/theme_bloc/theme_event.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Provider.of<ThemeBloc>(context, listen: false).add(const GetThemeEvent());
    Timer(const Duration(seconds: AppConstants.splashTime), () async {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPrimary,
      body: Center(
        child: Image.asset(GifAssets.shopLogo),
      ),
    );
  }
}
