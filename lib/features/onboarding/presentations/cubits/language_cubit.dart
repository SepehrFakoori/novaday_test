import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/enums/language_enum.dart';

class LanguageCubit extends Cubit<LanguageEnum> {
  LanguageCubit() : super(LanguageEnum.fa);

  // Set language
  void setLanguage(LanguageEnum language) => emit(language);
}
