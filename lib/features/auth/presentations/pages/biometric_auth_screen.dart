import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/NavigateProfileFromEnum.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/auth/presentations/cubits/biometric_auth_cubit.dart';

class BiometricAuthScreen extends StatelessWidget {
  const BiometricAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BiometricCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppLayoutGrid.margin),
            child: Column(
              children: [
                CustomAppBar(
                  title: context.localization.biometricSettings,
                  haveBackButton: false,
                ),
                const SizedBox(height: AppSpacing.sp24),
                BlocBuilder<BiometricCubit, bool>(
                  builder: (context, isBiometricEnabled) {
                    return Container(
                      width: context.width,
                      height: AppHeight.h48,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppLayoutGrid.margin,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.br12),
                        border: Border.all(
                          color: context.colorScheme.outline,
                          width: AppBorderWeight.sm,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              context.localization.activateFingerPrintAuth,
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          CustomSwitchButton(
                            isActive: isBiometricEnabled,
                            onChanged: (value) async {
                              if (value) {
                                final isAuthenticate =
                                    await LocalAuthentication().authenticate(
                                  localizedReason:
                                      'Enable biometric authentication',
                                );
                                if (isAuthenticate) {
                                  context
                                      .read<BiometricCubit>()
                                      .changeBiometric(isActive: true);
                                  customFlushBar(
                                    context,
                                    messageText:
                                        context.localization.savedSuccessfully,
                                    isError: false,
                                  );
                                }
                              } else {
                                context
                                    .read<BiometricCubit>()
                                    .changeBiometric(isActive: false);
                                customFlushBar(
                                  context,
                                  messageText: context.localization.canceled,
                                  isError: true,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFilledButton(
          buttonText: context.localization.continueButtonTitle,
          buttonState: ButtonStateEnum.active,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.profileScreen,
              arguments: NavigateProfileFromEnum.onboarding,
            );
          },
        ),
      ),
    );
  }
}
