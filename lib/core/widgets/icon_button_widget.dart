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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppHeight.h40,
        height: AppHeight.h40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.br12,
          ),
          color: context.colorScheme.surface,
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: AppBorderWeight.sm,
          ),
        ),
        child: Center(
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
