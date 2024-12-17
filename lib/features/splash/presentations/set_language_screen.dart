import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/cubits/filled_button_widget_cubit.dart';
import 'package:novaday_test/core/models/language_model.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';

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
                          languageModel: LanguageManager.allLanguages[index],
                        );
                      },
                      itemCount: LanguageManager.totalLanguages,
                    ),
                  ),
                ),
                const Spacer(),
                FilledButtonWidget(
                  buttonText: 'ادامه',
                  onPressed: () {
                    context.read<ButtonCubit>().buttonActive();
                  },
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
    return GestureDetector(
      onTap: () {
        LanguageManager.selectLanguage(languageModel.shortName);
        context.read<ButtonCubit>().buttonActive();
      },
      child: Container(
        decoration: BoxDecoration(
            color: !languageModel.isSelected
                ? AppColors.lightBackgroundSecondaryColor
                : AppColors.lightBlue08Color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: -4,
              ),
            ]),
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
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
              offstage: !languageModel.isSelected,
              child: SvgPicture.asset(AppIcons.checkBox),
            ),
          ],
        ),
      ),
    );
  }
}
