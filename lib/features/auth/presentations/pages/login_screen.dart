import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_routes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/custom_filled_button.dart';
import 'package:novaday_test/core/widgets/custom_app_bar.dart';
import 'package:novaday_test/features/auth/presentations/widgets/phone_entry_text_field_widget.dart';
import 'package:novaday_test/features/auth/presentations/widgets/select_country_bottom_sheet.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    CountryEntity selectedCountry =
        LanguageManagerUtils.getLanguageModel(LanguageEnum.fa);

    bool isClicked = false;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: Column(
            children: [
              CustomAppBar(title: context.localization.loginRegisterTitle),
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
                      Expanded(
                        child: PhoneEntryTextFieldWidget(
                          controller: phoneController,
                          hintText: '9301914321',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sp8),
                      // todo: It was AppSpacing.sp16
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const SelectCountryBottomSheet();
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: AppHeight.h24,
                                color: context.colorScheme.onSurface,
                              ),
                              const SizedBox(width: AppSpacing.sp12),
                              Text("${selectedCountry.countryCode}+",
                                  style: AppTextStyles.textTheme.titleMedium),
                              const SizedBox(width: AppSpacing.sp12),
                              SvgPicture.asset(selectedCountry.countryFlag!),
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
      floatingActionButton: CustomFilledButton(
        buttonText: context.localization.continueButtonTitle,
        buttonState: ButtonStateEnum.active,
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.otpScreen);
        },
      ),
    );
  }
}
