import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/app_constants.dart';

class OnboardingCubit extends Cubit<bool> {
  OnboardingCubit() : super(false) {
    _getBiometricSetting();
  }

  Future<void> _getBiometricSetting() async {
    final box = Hive.box(AppConstants.settingBoxDb);
    try {
      final bool isActive = await box.get(AppConstants.biometricAuthKeyDb);
      emit(isActive);
    } catch (e) {
      emit(false);
    }
  }

  Future<void> authenticateAndNavigate(Function onAuthenticate) async {
    if (state) {
      await Future.delayed(const Duration(seconds: 2));
      onAuthenticate();
    }
  }
}
