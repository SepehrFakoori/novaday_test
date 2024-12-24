import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/app_constants.dart';
import 'package:novaday_test/core/enums/language_enum.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale(LanguageEnum.fa.name)) {
    _getLocale();
  }

  Future<void> _saveLocale({required Locale locale}) async {
    final box = Hive.box(AppConstants.settingBoxDb);
    await box.put(AppConstants.localeKeyDb, locale.languageCode);
  }

  Future<void> _getLocale() async {
    final box = Hive.box(AppConstants.settingBoxDb);
    final String languageCode = await box.get(AppConstants.localeKeyDb);
    emit(Locale(languageCode));
  }

  void changeLocale({required Locale locale}) {
    emit(locale);
    _saveLocale(locale: locale);
  }
}
