import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';

class ButtonCubit extends Cubit<ButtonStateEnum> {
  ButtonCubit() : super(ButtonStateEnum.deActive);

  // Active
  void buttonActive() => emit(ButtonStateEnum.active);

  // Loading
  void buttonLoading() => emit(ButtonStateEnum.loading);

  // DeActive
  void buttonDeActive() => emit(ButtonStateEnum.deActive);
}
