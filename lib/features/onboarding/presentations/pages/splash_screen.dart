import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasInternetConnection = true;

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            userRegistered: () =>
                context.read<SplashCubit>().checkBiometricStatus(),
            userNotRegistered: () => Navigator.pushReplacementNamed(
                context, AppRoutes.setLocaleScreen),
            biometricAuthIsOn: () async {
              try {
                final isAuthenticate = await LocalAuthentication()
                    .authenticate(localizedReason: 'Privacy');
                LocalAuthentication().stopAuthentication().then((onValue) {
                  if (onValue) {
                    context.read<SplashCubit>().checkData();
                  } else {
                    context.read<SplashCubit>().checkData();
                  }
                });
                if (isAuthenticate) {
                  context.read<SplashCubit>().checkData();
                }
              } on PlatformException {
                // print(ex.stacktrace);
              }
            },
            biometricAuthIsOff: () =>
                context.read<SplashCubit>().checkData(),
            dataIsInDatabase: () => Navigator.pushReplacementNamed(
                context, AppRoutes.homeScreen),
            dataIsNotInDatabase: () {
              context.read<SplashCubit>().getData();
              // return Navigator.pushReplacementNamed(
              //   context, AppRoutes.homeScreen);
            },
            noInternetConnection: () {
              setState(() {
                hasInternetConnection = false;
              });
            }
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _appLogoSection(),
            hasInternetConnection ? _loadingSection(context) : _failedSection(context),
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
              style: context.textTheme.bodyMedium!.copyWith(
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
            style: context.textTheme.titleLarge!.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(width: AppSpacing.sp4),
          Text(
            '1.19',
            style: context.textTheme.titleLarge!.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> fetchPostDataFromApi() async {}
