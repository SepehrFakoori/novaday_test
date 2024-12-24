import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';

class ThemeCubit extends Cubit<ThemeEnum> {
  ThemeCubit() : super(ThemeEnum.light);
}
