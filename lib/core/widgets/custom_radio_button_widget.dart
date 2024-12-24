import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class CustomRadioButtonWidget extends StatelessWidget {
  const CustomRadioButtonWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        height: AppHeight.h48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          color: context.colorScheme.secondary,
        ),
        child: Row(
          children: [
            Radio<dynamic>(
              activeColor: context.colorScheme.primary,
              value: value,
              groupValue: groupValue,
              onChanged: (dynamic value) => onChanged(value),
            ),
            Text(
              title,
              style: AppTextStyles.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
