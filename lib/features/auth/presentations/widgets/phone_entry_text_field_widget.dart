import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class PhoneEntryTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int phoneNumberLength;
  final String? Function(String?)? validator;

  const PhoneEntryTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.phoneNumberLength,
    this.validator,
  });

  @override
  _PhoneEntryTextFieldWidget createState() => _PhoneEntryTextFieldWidget();
}

class _PhoneEntryTextFieldWidget extends State<PhoneEntryTextFieldWidget> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
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
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(widget.phoneNumberLength),
        ],
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              // Phone number length validation (should be more than 10 digits)
              if (value.replaceAll(RegExp(r'\D'), '').length <
                  widget.phoneNumberLength) {
                return 'Phone number must be at least ${widget.phoneNumberLength} digits';
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
