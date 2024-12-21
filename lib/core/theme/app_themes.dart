import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class AppThemes {
  static late ThemeData theme;

  void init(BuildContext context) {
    theme = Theme.of(context); // Phone Theme
  }

  // Theme
  static ThemeData themeData = ThemeData(
    textTheme: AppTextStyles.textTheme,

    /// ***** Filled Button Theme *****
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          AppColors.lightHoverPressingButtonColor,
        ),
      ),
    ),

    /// **** Bottom Sheet Theme ****
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBarrierColor: AppColors.lightLayoutColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
    ),

    /// **** Progress Indicator Theme ****
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimaryColor,
      circularTrackColor: AppColors.lightSeparatorColor,
    ),
  );

  // Light Theme
  static ThemeData lightThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.lightBgPrimaryColor,

    /// **** Color Scheme ****
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      onPrimary: AppColors.lightWhiteTextColor,
      surface: AppColors.lightBgPrimaryColor,
      onSurface: AppColors.lightTitleColor,
      secondary: AppColors.lightBgSecondaryColor,
      onSecondary: AppColors.lightTitleColor,
      onSecondaryContainer: AppColors.lightSubtitleColor,
      outlineVariant: AppColors.lightDefaultBorderColor,
      secondaryContainer: AppColors.lightBlue08Color,
      tertiaryContainer: AppColors.lightDeActiveButtonColor,
      onTertiaryContainer: AppColors.lightDisabledTextColor,
      onPrimaryFixed: AppColors.lightHoverPressingButtonColor,
    ),
  );

  // Dark Theme
  static ThemeData darkThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.darkBgPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      onPrimary: AppColors.darkWhiteTextColor,
      surface: AppColors.darkBgPrimaryColor,
      onSurface: AppColors.darkTitleColor,
      secondary: AppColors.darkBgSecondaryColor,
      onSecondary: AppColors.darkTitleColor,
      onSecondaryContainer: AppColors.darkSubtitleColor,
      outlineVariant: AppColors.darkDefaultBorderColor,
      secondaryContainer: AppColors.darkBlue08Color,
      tertiaryContainer: AppColors.darkDeActiveButtonColor,
      onTertiaryContainer: AppColors.darkDisabledTextColor,
      onPrimaryFixed: AppColors.darkHoverPressingButtonColor,
    ),
  );
}
