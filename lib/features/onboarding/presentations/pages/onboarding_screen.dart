import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_routes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/constants/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/onboarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: BlocBuilder<OnboardingCubit, bool>(
          builder: (context, isBiometricEnabled) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _appLogoSection(),
                if (isBiometricEnabled)
                  FutureBuilder<void>(
                    future: _handleBiometric(context),
                    builder: (context, snapshot) {
                      return _loadingSection(context, isBiometricEnabled);
                    },
                  ),
                _failedSection(context),
                _loadingSection(context, isBiometricEnabled),
                _appVersionNumberSection(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleBiometric(BuildContext context) async {
    final cubit = context.read<OnboardingCubit>();
    await cubit.authenticateAndNavigate(() {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

  Center _appLogoSection() {
    return Center(
      child: SvgPicture.asset(AppIcons.lightAppLogo),
    );
  }

  Positioned _failedSection(BuildContext context) {
    return Positioned(
      top: context.height * 0.5 + AppSpacing.sp40,
      child: SizedBox(
        width: context.width,
        height: context.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localization.failedToConnect,
              style: AppTextStyles.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _loadingSection(BuildContext context, bool isBiometricEnabled) {
    return Positioned(
      top: context.height * 0.5 + AppHeight.h72,
      child: SizedBox(
        width: context.width,
        height: context.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isBiometricEnabled)
              const SizedBox.square(
                dimension: AppHeight.h36,
                child: Icon(Icons.refresh),
              ),
          ],
        ),
      ),
    );
  }

  Positioned _appVersionNumberSection(BuildContext context) {
    return Positioned(
      bottom: AppSpacing.sp8,
      child: Row(
        children: [
          Text(
            context.localization.appVersion,
            style: AppTextStyles.textTheme.titleSmall!.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(width: AppSpacing.sp4),
          Text(
            '1.19',
            style: AppTextStyles.textTheme.titleSmall!.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
