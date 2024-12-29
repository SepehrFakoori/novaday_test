import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_key_constants.dart';

class BiometricCubit extends Cubit<bool> {
  BiometricCubit() : super(false) {
    _getBiometric();
  }

  Future<void> _saveBiometric({required bool isActive}) async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    await box.put(HiveKeyConstants.biometricAuthKey, isActive);
  }

  Future<void> _getBiometric() async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    try {
      final bool isActive = await box.get(HiveKeyConstants.biometricAuthKey);
      emit(isActive);
    } catch (ex) {
      emit(state);
    }
  }

  void changeBiometric({required bool isActive}) {
    emit(isActive);
    _saveBiometric(isActive: isActive);
  }
}
