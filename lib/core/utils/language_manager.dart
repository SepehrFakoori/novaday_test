import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/models/language_model.dart';
import 'package:novaday_test/core/theme/app_icons.dart';

class LanguageManager {
  static Language? _selectedLanguage;

  static final Map<Language, LanguageModel> _languages = {
    Language.en: LanguageModel(
      flag: AppIcons.englandFlag,
      title: "English",
      subtitle: "English",
      shortName: Language.en,
      isSelected: false,
    ),
    Language.fr: LanguageModel(
      flag: AppIcons.franceFlag,
      title: "Français",
      subtitle: "France",
      shortName: Language.fr,
      isSelected: false,
    ),
    Language.de: LanguageModel(
      flag: AppIcons.germanyFlag,
      title: "Deutsch",
      subtitle: "Germany",
      shortName: Language.de,
      isSelected: false,
    ),
    Language.ae: LanguageModel(
      flag: AppIcons.uaeFlag,
      title: "عربي",
      subtitle: "Arabic",
      shortName: Language.ae,
      isSelected: false,
    ),
    Language.tr: LanguageModel(
      flag: AppIcons.turkeyFlag,
      title: "Türkçe",
      subtitle: "Turkey",
      shortName: Language.tr,
      isSelected: false,
    ),
    Language.fa: LanguageModel(
      flag: AppIcons.iranFlag,
      title: "فارسی",
      subtitle: "Persian",
      shortName: Language.fa,
      isSelected: true,
    ),
  };

  static LanguageModel getLanguageModel(Language language) {
    final info = _languages[language];
    if (info == null) {
      throw Exception("Language not found");
    }
    return LanguageModel(
      flag: info.flag,
      title: info.title,
      subtitle: info.subtitle,
      shortName: info.shortName,
      isSelected: language == _selectedLanguage,
    );
  }

  static void selectLanguage(Language language) {
    if (!_languages.containsKey(language)) {
      throw Exception("Language not found");
    }
    _selectedLanguage = language;
  }

  static Language? get selectedLanguage => _selectedLanguage;

  static int get totalLanguages => _languages.length;

  static List<LanguageModel> get allLanguages => _languages.keys
      .map((lang) => getLanguageModel(lang))
      .toList();
}
