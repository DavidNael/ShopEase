import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopease/presentation/screens/authentication/auth_bloc/auth_bloc.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../resources/widgets_manager.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                      title: "Register Failed",
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
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m24),
                      child: Text(
                        AppStrings.register,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),

                    /// Username Text Field
                    WidgetManager.textFormField(
                      controller: context.read<AuthBloc>().usernameController,
                      hintText: 'Enter your username',
                      labelText: 'Username',
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      keyboardType: TextInputType.name,
                    ),

                    /// Phone Number Text Field
                    WidgetManager.textFormField(
                      controller: context.read<AuthBloc>().phoneController,
                      hintText: 'Enter your Phone Number',
                      labelText: 'Phone Number',
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      keyboardType: TextInputType.phone,
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m14),
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
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m14),
                      obscureText: true,
                    ),

                    /// Register Button
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s54,
                      child: WidgetManager.filledElevatedTextButton(
                        context: context,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthEvents.registerWithEmailAndPassword(),
                              );
                        },
                        text: AppStrings.register,
                      ),
                    ),

                    /// Already a member Text Button
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, Routes.login);
                      },
                      child: const Text(
                        AppStrings.alreadyMember,
                      ),
                    ),
                    const SizedBox(height: AppSize.s50),

                    /// OR Text Divider
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
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSize.s10),
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

                    /// Social Media Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
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
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
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
                    const SizedBox(height: AppSize.s50),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
