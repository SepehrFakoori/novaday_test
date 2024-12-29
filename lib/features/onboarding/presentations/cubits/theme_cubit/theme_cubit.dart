import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_key_constants.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';

class ThemeCubit extends Cubit<ThemeEnum> {
  ThemeCubit() : super(ThemeEnum.light) {
    _getTheme();
  }

  Future<void> _saveTheme({required ThemeEnum themeEnum}) async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    await box.put(HiveKeyConstants.themeKey, themeEnum.name);
  }

  Future<void> _getTheme() async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    try {
      final String theme = await box.get(HiveKeyConstants.themeKey);
      final ThemeEnum themeEnum =
          theme == ThemeEnum.light.name ? ThemeEnum.light : ThemeEnum.dark;
      emit(themeEnum);
    } catch (ex) {
      emit(state);
    }
  }

  void changeTheme({required ThemeEnum themeEnum}) {
    emit(themeEnum);
    _saveTheme(themeEnum: themeEnum);
  }
}
