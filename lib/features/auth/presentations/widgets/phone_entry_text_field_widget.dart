import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/formatters/phone_number_formatter.dart';

class PhoneEntryTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const PhoneEntryTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  _PhoneEntryTextFieldWidget createState() => _PhoneEntryTextFieldWidget();
}

class _PhoneEntryTextFieldWidget extends State<PhoneEntryTextFieldWidget> {
  late FocusNode _focusNode;
  late TextInputFormatter _inputFormatter;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _inputFormatter = PhoneNumberFormatter();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.onSecondary,
        ),
        inputFormatters: [_inputFormatter],
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              // Phone number length validation (should be more than 10 digits)
              if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
                return 'Phone number must be at least 10 digits';
              }
              return null;
            },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onSecondaryContainer,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
