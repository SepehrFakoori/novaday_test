abstract class SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {
  final bool isBiometricEnabled;

  SplashSuccessState(this.isBiometricEnabled);
}

class SplashFailedState extends SplashState {}
