import 'package:flutter/material.dart';
import 'package:shopease/presentation/screens/onboarding/onboarding_view.dart';


import '../screens/login/login_view.dart';
import '../screens/splash/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashScreen = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String main = '/main';
  static const String storeDetails = '/storeDetails';
  static const String onBoarding = '/onBoarding';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
        return undefinedRoute;
    }
  }

  static Route<dynamic> undefinedRoute = MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(
        child: Text(AppStrings.undefinedRoute),
      ),
    ),
  );
}
