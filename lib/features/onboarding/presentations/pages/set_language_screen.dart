import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/check_icon_widget.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/header_widget.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_theme_screen.dart';

class SetLanguageScreen extends StatelessWidget {
  const SetLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppLayoutGrid.margin,
            vertical: AppLayoutGrid.margin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(
                haveBackButton: false,
                title: context.localization.setLangTitle,
              ),
              const SizedBox(height: AppSpacing.sp24),
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _LanguageContainer(
                        languageModel: LanguageManagerUtils.allLanguages[index],
                      );
                    },
                    itemCount: LanguageEnum.values.length,
                  ),
                ),
              ),
              const Spacer(),
              FilledButtonWidget(
                buttonText: context.localization.continueButtonTitle,
                buttonState: ButtonStateEnum.active,
                onPressed: () {
                  onNextButtonClick(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNextButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (BuildContext context) {
                return ThemeCubit();
              },
            ),
          ],
          child: const SetThemeScreen(),
        ),
      ),
    );
  }
}

// Language Container Section
class _LanguageContainer extends StatelessWidget {
  const _LanguageContainer({
    required this.languageModel,
  });

  final CountryEntity languageModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return GestureDetector(
          onTap: () {
            onSelectLanguage(context);
          },
          child: Container(
            height: AppHeight.h48,
            decoration: BoxDecoration(
              color: !(locale.languageCode ==
                      languageModel.countryLanguageCode!.name)
                  ? AppColors.lightBgSecondaryColor
                  : AppColors.lightBlue08Color,
              border: const Border(
                bottom: BorderSide(
                  color: AppColors.lightDefaultBorderColor,
                  width: AppBorderWeight.sm,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppLayoutGrid.margin,
            ),
            child: Row(
              children: [
                SvgPicture.asset(languageModel.countryFlag!),
                const SizedBox(width: AppSpacing.sp16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageModel.countryName!,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: AppColors.lightTitleColor,
                        ),
                      ),
                      Text(
                        languageModel.countryLanguage!,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: AppColors.lightSubtitleColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                CheckIconWidget(
                    isActive: locale.languageCode ==
                        languageModel.countryLanguageCode!.name),
              ],
            ),
          ),
        );
      },
    );
  }

  void onSelectLanguage(BuildContext context) {
    context
        .read<LocaleCubit>()
        .changeLocale(locale: Locale(languageModel.countryLanguageCode!.name));
  }
}
