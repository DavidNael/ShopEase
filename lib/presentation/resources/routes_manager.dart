import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopease/presentation/screens/onboarding/onboarding_view.dart';
import 'package:shopease/presentation/screens/authentication/screens/register_view.dart';
import 'package:shopease/presentation/screens/splash/splash_view.dart';

import '../screens/authentication/screens/login_view.dart';
import '../screens/forgot_password/forgot_password_view.dart';
import '../screens/get_started/get_started_view.dart';
import '../screens/homepage/homepage_layout.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashScreen = '/';
  static const String getStarted = '/getStarted';
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
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const HomePageLayout());
      default:
        return undefinedRoute(settings);
    }
  }

  static Route<dynamic> undefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        if (kDebugMode) {
          print('Route not found: ${settings.name}');
        }
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.undefinedRoute),
          ),
        );
      },
    );
  }
}
