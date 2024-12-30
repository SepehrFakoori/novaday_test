import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_routes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/constants/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

// initialState: () =>
// context.read<SplashCubit>().checkAuthentication(),
// authenticatedState: () async {
// bool isBiometricEnabled =
//     await context.read<SplashCubit>().checkIfFingerPrintEnabled();
// if (isBiometricEnabled) {
//
// } else {
//
// }
// },
// unAuthenticatedState: () =>
// context.read<SplashCubit>().navigateToOnboarding(),
// fingerPrintEnabledState: () =>
// context.read<SplashCubit>().checkPostData(),
// fingerPrintDisabledState: () =>
// context.read<SplashCubit>().checkPostData(),
// postDataAvailableState: () =>
// context.read<SplashCubit>().navigateToDashboard(),
// postDataNotAvailableState: () async {
// await fetchPostDataFromApi();
// context.read<SplashCubit>().navigateToDashboard();
// },
// navigateToDashboard: () => Navigator.of(context)
//     .pushReplacementNamed(AppRoutes.profileScreen),
// navigateToOnboarding: () => Navigator.of(context)
//     .pushReplacementNamed(AppRoutes.setLocaleScreen),

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.when(
            initialState: () =>
                context.read<SplashCubit>().checkUserRegistration(),
            userRegistered: () =>
                context.read<SplashCubit>().checkBiometricStatus(),
            userNotRegistered: () => Navigator.pushReplacementNamed(
                context, AppRoutes.setLocaleScreen),
            biometricAuthIsOn: () async {
              try {
                final isAuthenticate = await LocalAuthentication()
                    .authenticate(localizedReason: 'Privacy');

                if (isAuthenticate) {
                  Future.delayed(const Duration(seconds: 2));
                  context.read<SplashCubit>().checkData(true);
                } else {
                  Future.delayed(const Duration(seconds: 2));
                  context.read<SplashCubit>().checkData(true);
                }
              } on PlatformException catch (ex) {
                print("EXCEPTION: $ex");
              }
            },
            biometricAuthIsOff: () =>
                context.read<SplashCubit>().checkData(true),
            dataIsInDatabase: () => Navigator.pushReplacementNamed(
                context, AppRoutes.profileScreen),
            dataIsNotInDatabase: () => Navigator.pushReplacementNamed(
                context, AppRoutes.profileScreen),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _appLogoSection(),
            _failedSection(context),
            _loadingSection(context),
            _appVersionNumberSection(context),
          ],
        ),
      ),
    );
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
              textAlign: TextAlign.center,
              style: AppTextStyles.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _loadingSection(BuildContext context) {
    return Positioned(
      top: context.height * 0.5 + AppHeight.h92,
      child: SizedBox(
        width: context.width,
        height: context.height * 0.5,
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

Future<void> fetchPostDataFromApi() async {}
