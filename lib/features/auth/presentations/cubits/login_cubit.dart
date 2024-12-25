import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/enums/language_enum.dart';

class LoginCubit extends Cubit<LanguageEnum> {
  LoginCubit() : super(LanguageEnum.fa);

  void changeCountry({required LanguageEnum languageEnum}) {
    emit(languageEnum);
  }
}
