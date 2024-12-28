import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class CheckIconWidget extends StatelessWidget {
  const CheckIconWidget({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isActive,
      child: Icon(
        Icons.check_circle,
        color: context.colorScheme.primary,
        size: AppHeight.h24,
      ),
    );
  }
}
