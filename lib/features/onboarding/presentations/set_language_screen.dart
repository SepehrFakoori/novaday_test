import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/cubits/filled_button_widget_cubit.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/header_widget.dart';
import 'package:novaday_test/features/onboarding/domain/entities/language_model.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/set_theme_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetLanguageScreen extends StatelessWidget {
  const SetLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

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
                title: localization.setLangTitle,
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
                buttonText: localization.continueButtonTitle,
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
            BlocProvider<ButtonCubit>(
              create: (BuildContext context) {
                var buttonCubit = ButtonCubit();
                buttonCubit.buttonActive();
                return buttonCubit;
              },
            ),
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
    super.key,
  });

  final LanguageModel languageModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageEnum>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            onSelectLanguage(context);
          },
          child: Container(
            height: AppHeight.h48,
            decoration: BoxDecoration(
              color: !(state == languageModel.langCode)
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
                SvgPicture.asset(languageModel.flag),
                const SizedBox(width: AppSpacing.sp16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageModel.title,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: AppColors.lightTitleColor,
                        ),
                      ),
                      Text(
                        languageModel.subtitle,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: AppColors.lightSubtitleColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: !(state == languageModel.langCode),
                  child: SvgPicture.asset(AppIcons.checkBox),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onSelectLanguage(BuildContext context) {
    context.read<LanguageCubit>().setLanguage(languageModel.langCode);
  }
}
