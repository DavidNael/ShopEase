import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/constants_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/presentation/screens/onboarding/bloc/onboarding_events.dart';
import '../../resources/routes_manager.dart';
import 'bloc/onboarding_states.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingStates>(
          builder: (context, state) {
            return PageView(
              onPageChanged: (newIndex) {
                bloc.add(OnboardingChangePageEvent(newIndex));
              },
              controller: bloc.pageController,
              children: [
                getPageView(
                  context: context,
                  title: AppStrings.onBoardingTitle1,
                  description: AppStrings.onBoardingDescription1,
                  image: ImageAssets.lazyLogo,
                ),
                getPageView(
                  context: context,
                  title: AppStrings.onBoardingTitle2,
                  description: AppStrings.onBoardingDescription2,
                  image: ImageAssets.shoppingLogo,
                ),
                getPageView(
                  context: context,
                  title: AppStrings.onBoardingTitle3,
                  description: AppStrings.onBoardingDescription3,
                  image: ImageAssets.shopLogoIcon,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: AppSize.s50,
        margin: const EdgeInsets.all(AppMargin.m14),
        child: BlocBuilder<OnboardingBloc, OnboardingStates>(
          builder: (context, state) {
            if (state is OnboardingPageChanged &&
                state.currentPage == AppConstants.onboardingPages - 1) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                child: const Text(AppStrings.getStartedText),
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        bloc.add(OnboardingPreviousPageEvent());
                      },
                      child: Text(
                        AppStrings.previousText,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppConstants.onboardingPages,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(AppPadding.p10),
                            child: SvgPicture.asset(
                              bloc.currentPage == index
                                  ? ImageAssets.selectedCircle
                                  : ImageAssets.unselectedCircle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        bloc.add(OnboardingNextPageEvent());
                      },
                      child: Text(
                        AppStrings.nextText,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: ColorManager.lightPrimary,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget getPageView({
  required BuildContext context,
  required String title,
  required String description,
  required String image,
}) {
  return Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: Container(
              color: ColorManager.lightPrimary,
            ),
          ),
          Expanded(
            child: Container(
              color: ColorManager.lightWhite,
            ),
          ),
        ],
      ),
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
            color: ColorManager.lightWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(AppPadding.p18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 200,
                height: 200,
                placeholderBuilder: (context) {
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
