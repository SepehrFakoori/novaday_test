import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h48,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: context.colorScheme.secondary,
          label: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sp4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br12),
              color: context.colorScheme.surface,
            ),
            child: Text(
              labelText,
              style: AppTextStyles.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
            borderSide: BorderSide(
              color: context.colorScheme.outline,
              // width: AppBorderWeight.sm,
            ),
          ),
        ),
      ),
    );
  }
}
