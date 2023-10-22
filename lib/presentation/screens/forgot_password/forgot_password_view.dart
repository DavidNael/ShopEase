import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: AppMargin.m24),
                  child: Text(
                    AppStrings.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Text(
                  AppStrings.forgotPasswordDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                WidgetManager.textFormField(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  margin: const EdgeInsets.only(
                      top: AppMargin.m14, bottom: AppMargin.m50),
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s54,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.send,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
