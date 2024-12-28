import 'package:flutter/material.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({
    super.key,
    this.onChanged,
    required this.isActive,
  });

  final void Function(bool)? onChanged;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Switch(
        value: isActive,
        onChanged: onChanged,
        activeColor: context.colorScheme.onPrimary,
        activeTrackColor: context.colorScheme.primary,
        inactiveTrackColor: context.colorScheme.tertiaryContainer,
        inactiveThumbColor: context.colorScheme.onPrimary,
      ),
    );
  }
}
