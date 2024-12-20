import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Container(
      height: AppHeight.h48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
        color: AppColors.lightBgTertiaryColor,
        border: Border.all(
          color: AppColors.lightDangerColor,
          width: AppBorderWeight.lg1,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.sp8),
      child: Row(
        children: [
          const Icon(Icons.cancel, color: Colors.red),
          const SizedBox(width: AppSpacing.sp8),
          Text(
            localization.otpTimeOutError,
            style: const TextStyle(color: AppColors.lightDangerColor),
          ),
        ],
      ),
    );
  }
}
