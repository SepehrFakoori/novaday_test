import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/app_constants.dart';

class BiometricCubit extends Cubit<bool> {
  BiometricCubit() : super(false) {
    _getBiometric();
  }

  Future<void> _saveBiometric({required bool isActive}) async {
    final box = Hive.box(AppConstants.settingBoxDb);
    await box.put(AppConstants.biometricAuthKeyDb, isActive);
  }

  Future<void> _getBiometric() async {
    final box = Hive.box(AppConstants.settingBoxDb);
    try {
      final bool isActive = await box.get(AppConstants.biometricAuthKeyDb);
      emit(isActive);
    } catch (e) {
      emit(state);
    }
  }

  void changeBiometric({required bool isActive}) {
    emit(isActive);
    _saveBiometric(isActive: isActive);
  }
}
