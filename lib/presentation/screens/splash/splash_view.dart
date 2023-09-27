import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: AppConstants.splashTime), () async {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
    return Scaffold(
      backgroundColor: ColorManager.lightPrimary,
      body: Center(
        child: Image.asset(GifAssets.shopLogo),
      ),
    );
  }
}
