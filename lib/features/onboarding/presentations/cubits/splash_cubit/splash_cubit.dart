import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_key_constants.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoadingState());

  Future<void> getBiometricSetting() async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    try {
      final bool isActive = await box.get(HiveKeyConstants.biometricAuthKey);
      emit(SplashSuccessState(isActive));
    } catch (ex) {
      emit(SplashSuccessState(false));
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
