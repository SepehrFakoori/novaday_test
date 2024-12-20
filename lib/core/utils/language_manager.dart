import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/features/onboarding/domain/entities/language_model.dart';

class LanguageManagerUtils {
  static final Map<LanguageEnum, LanguageModel> _languages = {
    LanguageEnum.en: LanguageModel(
      flag: AppIcons.englandFlag,
      title: "English",
      subtitle: "English",
      langCode: LanguageEnum.en,
      countryCode: 44,
    ),
    LanguageEnum.fr: LanguageModel(
      flag: AppIcons.franceFlag,
      title: "Français",
      subtitle: "France",
      langCode: LanguageEnum.fr,
      countryCode: 33,
    ),
    LanguageEnum.de: LanguageModel(
      flag: AppIcons.germanyFlag,
      title: "Deutsch",
      subtitle: "Germany",
      langCode: LanguageEnum.de,
      countryCode: 49,
    ),
    LanguageEnum.ae: LanguageModel(
      flag: AppIcons.uaeFlag,
      title: "عربي",
      subtitle: "Arabic",
      langCode: LanguageEnum.ae,
      countryCode: 971,
    ),
    LanguageEnum.tr: LanguageModel(
      flag: AppIcons.turkeyFlag,
      title: "Türkçe",
      subtitle: "Turkey",
      langCode: LanguageEnum.tr,
      countryCode: 90,
    ),
    LanguageEnum.fa: LanguageModel(
      flag: AppIcons.iranFlag,
      title: "فارسی",
      subtitle: "Persian",
      langCode: LanguageEnum.fa,
      countryCode: 98,
    ),
  };

  static LanguageModel getLanguageModel(LanguageEnum language) {
    final info = _languages[language];
    if (info == null) {
      throw Exception("Language not found");
    }
    return LanguageModel(
      flag: info.flag,
      title: info.title,
      subtitle: info.subtitle,
      langCode: info.langCode,
      countryCode: info.countryCode,
    );
  }

  static List<LanguageModel> get allLanguages =>
      _languages.keys.map((lang) => getLanguageModel(lang)).toList();
}
