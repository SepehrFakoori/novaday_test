import 'package:novaday_test/core/enums/language_enum.dart';

class LanguageModel {
  final String flag;
  final String title;
  final String subtitle;
  final Language shortName;
  final bool isSelected;

  LanguageModel({
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.shortName,
    required this.isSelected,
  });
}
