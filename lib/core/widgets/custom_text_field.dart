import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.readOnly = false,
    required this.labelText,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final bool isPassword;
  final String labelText;
  final TextInputType textInputType;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(updateIconVisibility);
  }

  @override
  void dispose() {
    widget.controller.removeListener(updateIconVisibility);
    super.dispose();
  }

  void updateIconVisibility() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h48,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? _isObscured : false,
        obscuringCharacter: '•',
        style: context.textTheme.titleMedium!.copyWith(
          color: context.colorScheme.onSecondary,
          fontSize: 18,
        ),
        readOnly: widget.readOnly,
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
              ? widget.controller.text.isNotEmpty
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
      ),
    );
  }
}
