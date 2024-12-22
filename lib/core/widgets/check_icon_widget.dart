import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/theme/app_colors.dart';

class CheckIconWidget extends StatelessWidget {
  const CheckIconWidget({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isActive,
      child: const Icon(
        Icons.check_circle,
        color: AppColors.lightPrimaryColor,
        size: AppHeight.h24,
      ),
    );
  }
}
