import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/enums/language_enum.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/theme/app_themes.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/features/onboarding/domain/entities/language_model.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

class SetLanguageScreen extends StatelessWidget {
  const SetLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: AppSizes.phoneWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'انتخاب زبان',
                  style: AppTextStyles.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTitleColor,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return LanguageContainer(
                          languageModel:
                              LanguageManagerUtils.allLanguages[index],
                        );
                      },
                      itemCount: LanguageEnum.values.length,
                    ),
                  ),
                ),
                const Spacer(),
                FilledButtonWidget(
                  buttonText: 'ادامه',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Language Container Section
class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
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
            context.read<LanguageCubit>().setLanguage(languageModel.langCode);
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
}
