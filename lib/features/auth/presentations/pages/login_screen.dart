import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/constants/app_icons.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/widgets/select_country_bottom_sheet.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: Column(
            children: [
              CustomAppBarWidget(
                  title: context.localization.loginRegisterTitle),
              const SizedBox(height: AppSpacing.sp24),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: context.width,
                  height: AppHeight.h48,
                  padding: const EdgeInsets.all(AppSpacing.sp4),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                    border: Border.all(
                      color: context.colorScheme.outline,
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
                              return BlocProvider<LocaleCubit>(
                                create: (context) => LocaleCubit(),
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
                            color: context.colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(
                              AppBorderRadius.br8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: AppHeight.h24,
                                color: context.colorScheme.onSurface,
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButtonWidget(
        buttonText: context.localization.continueButtonTitle,
        onPressed: () {},
      ),
    );
  }
}
