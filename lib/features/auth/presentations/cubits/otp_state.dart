class OtpState {
  final List<int> enteredFields;

  OtpState({this.enteredFields = const []});

  OtpState copyWith({List<int>? enteredFields}) {
    return OtpState(enteredFields: enteredFields ?? this.enteredFields);
  }
}
