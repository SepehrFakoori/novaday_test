import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (formatted.length >= 4 && formatted.length <= 6) {
      formatted = '${formatted.substring(0, 3)} ${formatted.substring(3)}';
    } else if (formatted.length > 6) {
      formatted =
          '${formatted.substring(0, 3)} ${formatted.substring(3, 6)} ${formatted.substring(6, 10)}';
    }
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
