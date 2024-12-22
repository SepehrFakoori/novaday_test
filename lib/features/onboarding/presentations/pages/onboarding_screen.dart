import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.lightBgPrimaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _appLogoSection(),
          _failedSection(localization),
          _loadingSection(),
          _appVersionNumberSection(localization),
        ],
      ),
    );
  }

  Center _appLogoSection() {
    return Center(
      child: SvgPicture.asset(AppIcons.lightAppLogo),
    );
  }

  Positioned _failedSection(AppLocalizations localization) {
    return Positioned(
      top: AppSizes.phoneHeight * 0.5 + AppSpacing.sp40,
      child: SizedBox(
        width: AppSizes.phoneWidth,
        height: AppSizes.phoneHeight * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              localization.failedToConnect,
              style: AppTextStyles.textTheme.bodyMedium!.copyWith(
                color: AppColors.lightSubtitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _loadingSection() {
    return Positioned(
      top: AppSizes.phoneHeight * 0.5 + AppHeight.h72,
      child: SizedBox(
        width: AppSizes.phoneWidth,
        height: AppSizes.phoneHeight * 0.5,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: AppHeight.h36,
              child: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _appVersionNumberSection(AppLocalizations localization) {
    return Positioned(
      bottom: AppSpacing.sp8,
      child: Row(
        children: [
          Text(
            localization.appVersion,
            style: AppTextStyles.textTheme.titleSmall!
                .copyWith(color: AppColors.lightSubtitleColor),
          ),
          const SizedBox(width: AppSpacing.sp4),
          Text(
            '1.19',
            style: AppTextStyles.textTheme.titleSmall!
                .copyWith(color: AppColors.lightSubtitleColor),
          ),
        ],
      ),
    );
  }
}
