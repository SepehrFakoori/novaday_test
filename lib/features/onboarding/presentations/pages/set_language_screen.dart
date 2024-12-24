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
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/check_icon_widget.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
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
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBarWidget(
                  haveBackButton: false,
                  title: context.localization.setLangTitle,
                ),
                const SizedBox(height: AppSpacing.sp24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _LanguageContainer(
                        languageEntity:
                            LanguageManagerUtils.allLanguages[index],
                      );
                    },
                    itemCount: LanguageEnum.values.length,
                  ),
                ),
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
    required this.languageEntity,
  });

  final CountryEntity languageEntity;

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
                      languageEntity.countryLanguageCode!.name)
                  ? context.colorScheme.secondary
                  : context.colorScheme.secondaryContainer,
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.outline,
                  width: AppBorderWeight.sm,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppLayoutGrid.margin,
            ),
            child: Row(
              children: [
                SvgPicture.asset(languageEntity.countryFlag!),
                const SizedBox(width: AppSpacing.sp16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageEntity.countryName!,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        languageEntity.countryLanguage!,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSecondaryContainer,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                CheckIconWidget(
                    isActive: locale.languageCode ==
                        languageEntity.countryLanguageCode!.name),
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
        .changeLocale(locale: Locale(languageEntity.countryLanguageCode!.name));
  }
}
