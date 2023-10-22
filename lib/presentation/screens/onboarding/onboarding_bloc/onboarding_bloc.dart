import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/screens/onboarding/onboarding_bloc/onboarding_events.dart';
import 'package:shopease/presentation/screens/onboarding/onboarding_bloc/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  int currentPage = 0;
  String buttonText = AppStrings.next;
  final int pageLength;
  PageController pageController = PageController();

  OnboardingBloc({
    required this.pageLength,
  }) : super(OnboardingInitial()) {
    on<OnboardingNextPageEvent>((event, emit) {
      emit(OnboardingLoading());
      if (currentPage == pageLength - 1) {
        currentPage = 0;
      } else {
        currentPage++;
      }
      setButtonText();
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuart,
      );
      emit(OnboardingPageChanged(currentPage));
    });

    on<OnboardingPreviousPageEvent>((event, emit) {
      emit(OnboardingLoading());
      if (currentPage == 0) {
        currentPage = pageLength - 1;
      } else {
        currentPage--;
      }
      setButtonText();
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuart,
      );
      emit(OnboardingPageChanged(currentPage));
    });

    on<OnboardingChangePageEvent>((event, emit) {
      emit(OnboardingLoading());
      currentPage = event.page;
      setButtonText();
      emit(OnboardingPageChanged(currentPage));
    });
  }

  void setButtonText() {
    if (currentPage == pageLength - 1) {
      buttonText = AppStrings.getStarted;
    } else {
      buttonText = AppStrings.next;
    }
  }

  @override
  Future<void> close() {
    pageController
        .dispose(); // Dispose the pageController when closing the bloc
    return super.close();
  }
}
