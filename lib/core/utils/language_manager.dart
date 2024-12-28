import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/constants/app_icons.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';

class LanguageManagerUtils {
  static final Map<LanguageEnum, CountryEntity> _languages = {
    LanguageEnum.en: CountryEntity(
      countryName: "English",
      countryLanguage: "English",
      countryLanguageCode: LanguageEnum.en,
      countryFlag: AppIcons.englandFlag,
      countryCode: 44,
      phoneNumberLength: 10,
    ),
    LanguageEnum.fr: CountryEntity(
      countryName: "Français",
      countryLanguage: "France",
      countryLanguageCode: LanguageEnum.fr,
      countryFlag: AppIcons.franceFlag,
      countryCode: 33,
      phoneNumberLength: 9,
    ),
    LanguageEnum.de: CountryEntity(
      countryName: "Deutsch",
      countryLanguage: "Germany",
      countryLanguageCode: LanguageEnum.de,
      countryFlag: AppIcons.germanyFlag,
      countryCode: 49,
      phoneNumberLength: 10,
    ),
    LanguageEnum.ae: CountryEntity(
      countryName: "عربي",
      countryLanguage: "Arabic",
      countryLanguageCode: LanguageEnum.ae,
      countryFlag: AppIcons.uaeFlag,
      countryCode: 971,
      phoneNumberLength: 7,
    ),
    LanguageEnum.tr: CountryEntity(
      countryName: "Türkçe",
      countryLanguage: "Turkey",
      countryLanguageCode: LanguageEnum.tr,
      countryFlag: AppIcons.turkeyFlag,
      countryCode: 90,
      phoneNumberLength: 10,
    ),
    LanguageEnum.fa: CountryEntity(
      countryName: "فارسی",
      countryLanguage: "Persian",
      countryLanguageCode: LanguageEnum.fa,
      countryFlag: AppIcons.iranFlag,
      countryCode: 98,
      phoneNumberLength: 10,
    ),
  };

  static CountryEntity getLanguageModel(LanguageEnum language) {
    final info = _languages[language];
    if (info == null) {
      throw Exception("Language not found");
    }
    return CountryEntity(
      countryName: info.countryName,
      countryLanguage: info.countryLanguage,
      countryLanguageCode: info.countryLanguageCode,
      countryFlag: info.countryFlag,
      countryCode: info.countryCode,
      phoneNumberLength: info.phoneNumberLength,
    );
  }

  static List<CountryEntity> get allLanguages =>
      _languages.keys.map((lang) => getLanguageModel(lang)).toList();
}
