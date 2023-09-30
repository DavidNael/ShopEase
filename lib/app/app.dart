import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/presentation/resources/constants_manager.dart';
import 'package:shopease/presentation/screens/onboarding/bloc/onboarding_bloc.dart';

import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (context) =>
              OnboardingBloc(pageLength: AppConstants.onboardingPages),
        ),
      ],
      child: MaterialApp(
        title: 'Shop Ease',
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RoutesGenerator.getRoute,
        theme: getApplicationTheme(
          isDark:
              SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                  Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
