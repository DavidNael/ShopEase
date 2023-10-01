import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/app/theme_bloc/theme_bloc.dart';
import 'package:shopease/presentation/resources/constants_manager.dart';
import 'package:shopease/presentation/screens/homepage/bloc/homepage_bloc.dart';
import 'package:shopease/presentation/screens/onboarding/bloc/onboarding_bloc.dart';

import '../presentation/resources/routes_manager.dart';

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
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Shop Ease',
            initialRoute: Routes.splashScreen,
            onGenerateRoute: RoutesGenerator.getRoute,
            theme: state,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
