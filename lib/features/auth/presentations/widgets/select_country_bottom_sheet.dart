import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/check_icon_widget.dart';
import 'package:novaday_test/features/onboarding/domain/entities/language_model.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

class SelectCountryBottomSheet extends StatelessWidget {
  const SelectCountryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.only(
        bottom: AppSpacing.sp16,
        left: AppSpacing.sp16,
        right: AppSpacing.sp16,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
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
                SvgPicture.asset(languageModel.flag),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageModel.subtitle,
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '+${languageModel.countryCode.toString()}',
                        style: AppTextStyles.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSecondaryContainer,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                CheckIconWidget(isActive: state == languageModel.langCode),
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
