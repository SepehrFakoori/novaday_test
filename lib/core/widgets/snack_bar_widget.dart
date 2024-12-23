import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
        color: context.colorScheme.tertiary,
        border: Border.all(
          color: context.colorScheme.onError,
          width: AppBorderWeight.lg1,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.sp8),
      child: Row(
        children: [
          const Icon(Icons.cancel, color: Colors.red),
          const SizedBox(width: AppSpacing.sp8),
          Text(
            context.localization.otpTimeOutError,
            style: TextStyle(
              color: context.colorScheme.onError,
            ),
          ),
        ],
      ),
    );
  }
}
