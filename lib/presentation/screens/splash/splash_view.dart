import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import '../../../app/constants.dart';
import '../../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: AppConstants.splashTime), () async {
      Navigator.pushReplacementNamed(context, Routes.main);
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
