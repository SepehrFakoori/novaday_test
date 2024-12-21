import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/features/onboarding/domain/entities/language_model.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

class SelectCountryBottomSheet extends StatelessWidget {
  const SelectCountryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.sp16,
        left: AppSpacing.sp16,
        right: AppSpacing.sp16,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBgSecondaryColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
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
    );
  }
}

// Language Container Section
class _LanguageContainer extends StatelessWidget {
  const _LanguageContainer({
    required this.languageModel,
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
                const SizedBox(width: 16),
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
