import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/enums/enums.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale(LanguageEnum.fa.name)) {
    _getLocale();
  }

  Future<void> _saveLocale({required Locale locale}) async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    await box.put(HiveKeyConstants.localeKey, locale.languageCode);
  }

  Future<void> _getLocale() async {
    final box = Hive.box(HiveBoxConstants.settingBox);
    try {
      final String languageCode = await box.get(HiveKeyConstants.localeKey);
      emit(Locale(languageCode));
    } catch (ex) {
      emit(state);
    }
  }

  void changeLocale({required Locale locale}) {
    emit(locale);
    _saveLocale(locale: locale);
  }
}
