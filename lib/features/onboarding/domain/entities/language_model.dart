import 'package:novaday_test/core/enums/language_enum.dart';

class LanguageModel {
  final String flag;
  final String title;
  final String subtitle;
  final LanguageEnum langCode;
  // final String countryNumber;

  LanguageModel({
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.langCode,
    // required this.countryNumber,
  });
}
