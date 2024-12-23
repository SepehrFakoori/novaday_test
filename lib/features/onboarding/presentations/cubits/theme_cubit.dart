import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _getTheme();
  }

  Future<void> _saveTheme({required ThemeMode themeMode}) async {
    final box = Hive.box('settings');
    await box.put('theme', themeMode.name);
  }

  Future<void> _getTheme() async {
    final box = Hive.box('settings');
    final themeModeString = await box.get('theme');
    if (themeModeString == 'light') {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  void changeTheme({required ThemeMode themeMode}) {
    emit(themeMode);
    _saveTheme(themeMode: themeMode);
  }
}
