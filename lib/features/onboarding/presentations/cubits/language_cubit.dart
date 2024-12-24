// import 'dart:ui';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:novaday_test/core/enums/language_enum.dart';

// class LanguageCubit extends Cubit<LanguageEnum> {
//   LanguageCubit() : super(LanguageEnum.fa);
//
//   // Set language
//   void setLanguage(LanguageEnum language) => emit(language);
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('fa')) {
    _getLocale();
  }

  Future<void> _saveLocale({required Locale locale}) async {
    final box = Hive.box('settings');
    await box.put('locale', locale.languageCode);
  }

  Future<void> _getLocale() async {
    final box = Hive.box('settings');
    final localeLanguageCodeString = await box.get('locale');
    emit(Locale(localeLanguageCodeString));
  }

  void changeLocale({required Locale locale}) {
    emit(locale);
    _saveLocale(locale: locale);
  }
}
