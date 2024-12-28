import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_routes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/custom_app_bar.dart';
import 'package:novaday_test/core/widgets/custom_snack_bar.dart';
import 'package:novaday_test/core/widgets/custom_switch_button.dart';
import 'package:novaday_test/core/widgets/custom_filled_button.dart';
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
                              style:
                                  AppTextStyles.textTheme.titleMedium!.copyWith(
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
                                    messageText: context.localization.savedSuccessfully,
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
            Navigator.pushNamed(context, AppRoutes.profileScreen);
          },
        ),
      ),
    );
  }
}
