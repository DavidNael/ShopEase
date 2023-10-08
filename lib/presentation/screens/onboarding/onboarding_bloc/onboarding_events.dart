abstract class OnboardingEvents {
}
class OnboardingNextPageEvent extends OnboardingEvents {
}

class OnboardingPreviousPageEvent extends OnboardingEvents {
}
class OnboardingChangePageEvent extends OnboardingEvents {
  final int page;
  OnboardingChangePageEvent(this.page);
}

class OnboardingFinishEvent extends OnboardingEvents {
}