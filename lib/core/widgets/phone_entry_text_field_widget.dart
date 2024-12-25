import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class PhoneEntryTextFieldWidget extends StatelessWidget {
  const PhoneEntryTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    this.validator,
    required this.hintText,
    this.inputFormatters,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: TextInputType.phone,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: AppTextStyles.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
        color: context.colorScheme.onSecondary,
      ),
      inputFormatters: inputFormatters,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a phone number';
            }
            if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
              return 'Phone number must be at least 10 digits';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.onSecondaryContainer,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
