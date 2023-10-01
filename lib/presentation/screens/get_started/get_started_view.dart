import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/constants_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _loginButtonAnimation;
  late Animation<double> _registerButtonAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: AppConstants.animationTime));
    _loginButtonAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _registerButtonAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 0.0),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 60.0,
      ),
    ]).animate(_animationController);

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Image.asset(
              ImageAssets.shoppingBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Started',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: ColorManager.white,
                        )),
                FadeTransition(
                  opacity: _loginButtonAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    ).animate(_loginButtonAnimation),
                    child: Container(
                      width: double.infinity,
                      height: AppSize.s54,
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m24),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                ColorManager.lightPrimary,
                              ),
                            ),
                        child: const Text(
                          AppStrings.login,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s54,
                  child: FadeTransition(
                    opacity: _registerButtonAnimation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 2),
                        end: const Offset(0, 0),
                      ).animate(_registerButtonAnimation),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                ColorManager.lightPrimary,
                              ),
                            ),
                        child: const Text(
                          AppStrings.register,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
