import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
  });

  final String labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void focusChanger() {
    if (focusNode.hasFocus) {
      setState(() {
        hasFocus = true;
      });
    } else {
      setState(() {
        hasFocus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.phone,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
