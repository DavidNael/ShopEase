import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgotPasswordTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.forgotPasswordDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              WidgetsManager.textFormField(
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
                    AppStrings.sendText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
