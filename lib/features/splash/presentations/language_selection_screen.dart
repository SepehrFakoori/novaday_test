import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
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
                  width: size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const Column(
                      children: [
                        LanguageContainer(
                          flag: AppIcons.englandFlag,
                          langTitle: 'English',
                          langSubTitle: 'English',
                        ),
                        LanguageContainer(
                          flag: AppIcons.franceFlag,
                          langTitle: 'Français',
                          langSubTitle: 'France',
                        ),
                        LanguageContainer(
                          flag: AppIcons.germanyFlag,
                          langTitle: 'Deutsch',
                          langSubTitle: 'Germany',
                        ),
                        LanguageContainer(
                          flag: AppIcons.uaeFlag,
                          langTitle: 'عربي',
                          langSubTitle: 'Arabic',
                        ),
                        LanguageContainer(
                          flag: AppIcons.turkeyFlag,
                          langTitle: 'Türkçe',
                          langSubTitle: 'Turkey',
                        ),
                        LanguageContainer(
                          flag: AppIcons.iranFlag,
                          langTitle: 'فارسی',
                          langSubTitle: 'Persian',
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const FilledButtonWidget(),
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
    required this.flag,
    required this.langTitle,
    required this.langSubTitle,
    super.key,
  });

  final String flag;
  final String langTitle;
  final String langSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundSecondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: -4,
          ),
        ]
      ),
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 7,
      ),
      child: Row(
        children: [
          SvgPicture.asset(flag),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                langTitle,
                style: AppTextStyles.textTheme.titleMedium!.copyWith(
                  color: AppColors.lightTitleColor,
                ),
              ),
              Text(
                langSubTitle,
                style: AppTextStyles.textTheme.titleMedium!.copyWith(
                  color: AppColors.lightSubtitleColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
