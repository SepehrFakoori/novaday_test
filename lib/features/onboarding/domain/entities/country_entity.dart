import 'package:novaday_test/core/enums/language_enum.dart';

class CountryEntity {
  final String? countryName;
  final String? countryLanguage;
  final LanguageEnum? countryLanguageCode;
  final String? countryFlag;
  final int? countryCode;

  CountryEntity({
    required this.countryName,
    required this.countryLanguage,
    required this.countryLanguageCode,
    required this.countryFlag,
    required this.countryCode,
  });
}
