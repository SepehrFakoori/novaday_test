import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState());

  void updateField(int fieldIndex) {
    final updatedFields = List<int>.from(state.enteredFields)..add(fieldIndex);
    emit(state.copyWith(enteredFields: updatedFields));
  }
}
