import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';

class SetThemeScreen extends StatelessWidget {
  const SetThemeScreen({super.key});

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
                  'نمایش اکسس',
                  style: AppTextStyles.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTitleColor,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightBgSecondaryColor,
                      ),
                      child: Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: true,
                            onChanged: (bool? value) {},
                          ),
                          Text(
                            'data',
                            style:
                                AppTextStyles.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightBgSecondaryColor,
                      ),
                      child: Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: true,
                            onChanged: (bool? value) {},
                          ),
                          Text(
                            'data',
                            style:
                            AppTextStyles.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
