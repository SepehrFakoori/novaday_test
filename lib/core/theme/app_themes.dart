import 'package:flutter/material.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class AppThemes {
  // Theme
  static ThemeData themeData = ThemeData(
    textTheme: AppTextStyles.textTheme,
  );

  // Light Theme
  static ThemeData lightThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.lightBackgroundPrimaryColor,

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimaryColor,
      circularTrackColor: AppColors.lightSeparatorColor,
    ),
  );

  // Dark Theme
  static ThemeData darkThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.darkBackgroundPrimaryColor,

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkWhiteTextColor,
      circularTrackColor: Colors.transparent,
    ),
  );
}
