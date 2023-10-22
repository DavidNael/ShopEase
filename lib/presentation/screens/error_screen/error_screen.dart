import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  const ErrorScreen({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(JsonAssets.errorAnimation),
          Text(message ?? AppStrings.somethingWrongText),
        ],
      ),
    );
  }
}
