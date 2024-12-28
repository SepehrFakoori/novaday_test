abstract class OnboardingState {}

class OnBoardingLoadingState extends OnboardingState {}

class OnBoardingSuccessState extends OnboardingState {
  final bool isBiometricEnabled;

  OnBoardingSuccessState(this.isBiometricEnabled);
}

class OnBoardingFailedState extends OnboardingState {}
