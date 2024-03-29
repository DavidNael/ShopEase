import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../auth_bloc/auth_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  initial: () {
                    WidgetManager.showLoadingDialog(
                      context: context,
                      message: AppStrings.loading,
                    );
                  },
                  loaded: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.main,
                      (route) => false,
                    );
                  },
                  error: (message) {
                    Navigator.pop(context);
                    WidgetManager.showMessageDialog(
                      context: context,
                      title: "Login Failed",
                      message: message,
                    );
                  },
                  orElse: () {
                    WidgetManager.showLoadingDialog(
                      context: context,
                      message: AppStrings.loading,
                    );
                  },
                );
              },
              builder: (context, state) {
                return loginWidget(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget loginWidget(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      /// Login Text
      Container(
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m24),
        child: Text(
          AppStrings.login,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),

      /// Email Text Field
      WidgetManager.textFormField(
        controller: context.read<AuthBloc>().emailController,
        hintText: 'Enter your email',
        labelText: 'Email',
        keyboardType: TextInputType.emailAddress,
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),

      /// Password Text Field
      WidgetManager.textFormField(
        controller: context.read<AuthBloc>().passwordController,
        hintText: 'Enter your password',
        labelText: 'Password',
        color: Theme.of(context).inputDecorationTheme.fillColor,
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m14),
        obscureText: true,
      ),

      Row(
        children: [
          /// Remember Me Checkbox
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),

          /// Remember Me Text
          Text(
            AppStrings.rememberMe,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),

          /// Forgot Password Text Button
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.forgotPassword,
              );
            },
            child: const Text(
              AppStrings.forgotPassword,
            ),
          ),
        ],
      ),

      /// Login Button
      SizedBox(
        width: double.infinity,
        height: AppSize.s54,
        child: WidgetManager.filledElevatedTextButton(
          context: context,
          onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthEvents.emailLoginEvent(),
                );
          },
          text: AppStrings.login,
        ),
      ),

      /// No Account Text Button
      TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, Routes.register);
        },
        child: const Text(
          AppStrings.noAccount,
        ),
      ),
      const SizedBox(height: AppSize.s50),
      Container(
        margin: const EdgeInsets.only(bottom: AppMargin.m14),
        child: const Row(
          children: [
            Expanded(
              child: Divider(
                color: ColorManager.lightGrey,
                thickness: AppSize.s0_5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
              child: Text(
                AppStrings.or,
              ),
            ),
            Expanded(
              child: Divider(
                color: ColorManager.lightGrey,
                thickness: AppSize.s0_5,
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s25,
                      ),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(
                      AppPadding.p12,
                    ),
                  ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: SvgPicture.asset(
                ImageAssets.googleLogo,
                width: AppSize.s40,
                height: AppSize.s40,
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s25,
                      ),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(
                      AppPadding.p12,
                    ),
                  ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: SvgPicture.asset(
                ImageAssets.facebookLogo,
                width: AppSize.s40,
                height: AppSize.s40,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
