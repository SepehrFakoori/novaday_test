import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({required this.icon, this.onTap, super.key});

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: context.colorScheme.tertiary,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
        side: BorderSide(
          color: context.colorScheme.outlineVariant,
          width: AppBorderWeight.sm,
        ),
      ),
      child: Container(
        width: AppHeight.h40,
        height: AppHeight.h40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: AppBorderWeight.md,
          ),
        ),
        child: SizedBox.square(
          dimension: AppHeight.h40,
          child: Icon(
            icon,
            color: context.colorScheme.onSurface,
            size: AppHeight.h16,
          ),
        ),
      ),
    );
  }
}
