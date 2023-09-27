import 'package:equatable/equatable.dart';

abstract class OnboardingStates extends Equatable {
  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingStates {}

class OnboardingLoading extends OnboardingStates {}

class OnboardingFinished extends OnboardingStates {}

class OnboardingPageChanged extends OnboardingStates {
  final int currentPage;
  OnboardingPageChanged(this.currentPage);
}

class OnboardingError extends OnboardingStates {
  final String message;
  OnboardingError(this.message);
}
