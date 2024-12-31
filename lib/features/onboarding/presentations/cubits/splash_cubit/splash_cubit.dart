import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initialState()) {
    checkUserRegistration();
  }

  Future<void> checkUserRegistration() async {
    try {
      final box = Hive.box(HiveBoxConstants.settingBox);
      final String theme = await box.get(HiveKeyConstants.themeKey);
      emit(const SplashState.userRegistered());
      print("REGISTERED ++++++++++++++++++");
    } catch (ex) {
      emit(const SplashState.userNotRegistered());
      print("NOT REGISTERED ++++++++++++++++++");
    }
  }

  Future<void> checkBiometricStatus() async {
    try {
      final box = Hive.box(HiveBoxConstants.settingBox);
      final bool isEnabled = box.get(HiveKeyConstants.biometricAuthKey);
      print(isEnabled);
      if (isEnabled) {
        emit(const SplashState.biometricAuthIsOn());
        print("BIOMETRIC IS ON ++++++++++++++++++");
      } else {
        emit(const SplashState.biometricAuthIsOff());
        print("BIOMERIC IS OFF ++++++++++++++++++");
      }
    } catch (ex) {
      emit(const SplashState.biometricAuthIsOff());
      print("BIOMETRIC ERROR ++++++++++++++++++");
    }
  }

  Future<void> checkData(bool haveData) async {
    // todo: Use try-catch to detect data is in database or not
    if (haveData) {
      emit(const SplashState.dataIsInDatabase());
      print("HAS DATA ++++++++++++++++++");
    } else {
      emit(const SplashState.dataIsNotInDatabase());
      print("HAS NOT DATA ++++++++++++++++++");
    }
  }
}
