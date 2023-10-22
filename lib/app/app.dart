import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopease/app/constants.dart';
import 'package:shopease/app/dep_injection.dart';
import 'package:shopease/app/theme_bloc/theme_bloc.dart';
import 'package:shopease/presentation/screens/login/login_bloc/login_bloc.dart';
import 'package:shopease/presentation/screens/onboarding/onboarding_bloc/onboarding_bloc.dart';
import 'package:shopease/presentation/screens/products/products_bloc/products_bloc.dart';
import 'package:shopease/presentation/screens/register/register_bloc/register_bloc.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/screens/homepage/homepage_bloc/homepage_bloc.dart';

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
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            GetIt.instance<ThemeManager>(),
          ),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => getItInstance<ProductsBloc>(),
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
