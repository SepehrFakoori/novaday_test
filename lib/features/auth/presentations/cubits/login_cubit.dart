import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/enums/country_enum.dart';

class LoginCubit extends Cubit<CountryEnum> {
  LoginCubit() : super(CountryEnum.ir);

  void changeCountry({required CountryEnum countryEnum}) {
    emit(countryEnum);
  }
}
