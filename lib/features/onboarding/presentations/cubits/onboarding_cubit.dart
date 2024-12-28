import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/app_constants.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnBoardingLoadingState());

  Future<void> getBiometricSetting() async {
    final box = Hive.box(AppConstants.settingBoxDb);
    try {
      final bool isActive = await box.get(AppConstants.biometricAuthKeyDb);
      emit(OnBoardingSuccessState(isActive));
    } catch (e) {
      emit(OnBoardingSuccessState(false));
    }
  }

  Future<void> authenticateAndNavigate(Future<void> Function() onAuthenticate) async {
    if (true) {
      await Future.delayed(const Duration(seconds: 3));
      getBiometricSetting();
      onAuthenticate();
    }
  }
}
