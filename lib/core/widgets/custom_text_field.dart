import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  });

  final bool isPassword;
  final String labelText;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  bool hasFocus = false;
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(updateIconVisibility);
  }

  @override
  void dispose() {
    controller.removeListener(updateIconVisibility);
    super.dispose();
  }

  void updateIconVisibility() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? _isObscured : false,
      obscuringCharacter: '•',
      style: context.textTheme.titleMedium!.copyWith(
        color: context.colorScheme.onSecondary,
        fontSize: 18,
      ),
      enableSuggestions: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.secondary,
        labelText: widget.labelText,
        labelStyle: context.textTheme.titleMedium!.copyWith(
          color: context.colorScheme.onSecondaryContainer,
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sp8,
          vertical: AppSpacing.sp4,
        ),
        suffixIcon: widget.isPassword
            ? controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          borderSide: BorderSide(
            color: context.colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          borderSide: BorderSide(
            color: context.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
