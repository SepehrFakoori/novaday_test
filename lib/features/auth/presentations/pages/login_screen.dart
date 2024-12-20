import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/header_widget.dart';
import 'package:novaday_test/features/auth/presentations/widgets/select_country_bottom_sheet.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: Column(
            children: [
              HeaderWidget(title: localization.loginRegisterTitle),
              const SizedBox(height: AppSpacing.sp24),
              Container(
                width: AppSizes.phoneWidth,
                height: AppHeight.h48,
                padding: const EdgeInsets.all(AppSpacing.sp4),
                decoration: BoxDecoration(
                  color: AppColors.lightBgSecondaryColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                  border: Border.all(
                    color: AppColors.lightDefaultBorderColor,
                    width: AppBorderWeight.sm,
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(child: Text("Text Field Here")),
                    ),
                    const SizedBox(width: AppSpacing.sp16),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return BlocProvider<LanguageCubit>(
                              create: (context) => LanguageCubit(),
                              child: const SelectCountryBottomSheet(),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: AppHeight.h40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sp16,
                          vertical: AppSpacing.sp8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightBgTertiaryColor,
                          borderRadius: BorderRadius.circular(
                            AppBorderRadius.br8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: AppHeight.h24,
                              color: AppColors.lightTitleColor,
                            ),
                            const SizedBox(width: AppSpacing.sp12),
                            const Text("+98"),
                            const SizedBox(width: AppSpacing.sp12),
                            SvgPicture.asset(AppIcons.englandFlag),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FilledButtonWidget(
                buttonText: localization.continueButtonTitle,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
