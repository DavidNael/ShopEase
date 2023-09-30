import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.login,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetsManager.textFormField(
                hintText: 'Enter your email',
                labelText: 'Email',
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              WidgetsManager.textFormField(
                hintText: 'Enter your password',
                labelText: 'Password',
                color: Theme.of(context).inputDecorationTheme.fillColor,
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m14),
                obscureText: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    AppStrings.rememberMe,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
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
              SizedBox(
                width: double.infinity,
                height: AppSize.s54,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.login,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.register);
                },
                child: const Text(
                  AppStrings.noAccount,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m50),
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
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
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
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
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
          ),
        ),
      ),
    );
  }
}

// Widget loginWidget(BuildContext context) {

// }
