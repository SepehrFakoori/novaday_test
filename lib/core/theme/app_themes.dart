import 'package:flutter/material.dart';
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
  );

  // Light Theme
  static ThemeData lightThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.lightBgPrimaryColor,

    /// **** Color Scheme ****
    colorScheme: ColorScheme.light(
      // Primary Colors
      primary: AppColors.lightPrimaryColor,
      onPrimary: AppColors.lightWhiteTextColor,
      primaryContainer: AppColors.lightBlue08Color,
      onPrimaryContainer: AppColors.lightBlueTextColor,

      // Secondary Colors
      secondary: AppColors.lightBgSecondaryColor,
      onSecondary: AppColors.lightSubtitleColor,
      secondaryContainer: AppColors.lightBgTertiaryColor,
      onSecondaryContainer: AppColors.lightTitleColor,

      // Tertiary Colors
      tertiary: AppColors.lightActiveButtonColor,
      onTertiary: AppColors.lightWhiteTextColor,
      tertiaryContainer: AppColors.lightHoverPressingButtonColor,
      onTertiaryContainer: AppColors.lightTintButtonColor,

      // Error Colors
      error: AppColors.lightDangerColor,
      onError: AppColors.lightWhiteTextColor,
      errorContainer: AppColors.lightDanger08Color,
      onErrorContainer: AppColors.lightFailedColor,

      // Background Colors
      background: AppColors.lightBgPrimaryColor,
      onBackground: AppColors.lightTitleColor,

      // Surface Colors
      surface: AppColors.lightBgSecondaryColor,
      onSurface: AppColors.lightSubtitleColor,
      surfaceVariant: AppColors.lightSeparatorColor,
      onSurfaceVariant: AppColors.lightDefaultBorderColor,

      // Outline Colors
      outline: AppColors.lightActiveBorderColor,
      outlineVariant: AppColors.lightDefaultBorderColor,

      // Shadow
      shadow: AppColors.lightShadowColor,

      // Inverse Colors
      inverseSurface: AppColors.lightBlue08Color,
      onInverseSurface: AppColors.lightBlueTextColor,
      inversePrimary: AppColors.lightHoverPressingButtonColor,

      // Scrim
      scrim: AppColors.lightLayoutColor,
    ),

    /// **** Filled Button Theme ****
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        overlayColor: const WidgetStatePropertyAll(
          AppColors.lightHoverPressingButtonColor,
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(AppSizes.phoneWidth, AppHeight.h48),
        ),
      ),
    ),

    /// **** Progress Indicator Theme ****
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimaryColor,
      circularTrackColor: AppColors.lightSeparatorColor,
    ),
  );

  // Dark Theme
  static ThemeData darkThemeData = themeData.copyWith(
    scaffoldBackgroundColor: AppColors.darkBgPrimaryColor,

    colorScheme: const ColorScheme.dark(
      // Primary Colors
      primary: AppColors.darkPrimaryColor,
      onPrimary: AppColors.darkWhiteTextColor,
      primaryContainer: AppColors.darkBlue08Color,
      onPrimaryContainer: AppColors.darkBlueTextColor,

      // Secondary Colors
      secondary: AppColors.darkBgSecondaryColor,
      onSecondary: AppColors.darkSubtitleColor,
      secondaryContainer: AppColors.darkBgTertiaryColor,
      onSecondaryContainer: AppColors.darkTitleColor,

      // Tertiary Colors
      tertiary: AppColors.darkActiveButtonColor,
      onTertiary: AppColors.darkWhiteTextColor,
      tertiaryContainer: AppColors.darkHoverPressingButtonColor,
      onTertiaryContainer: AppColors.darkTintButtonColor,

      // Error Colors
      error: AppColors.darkDangerColor,
      onError: AppColors.darkWhiteTextColor,
      errorContainer: AppColors.darkDanger08Color,
      onErrorContainer: AppColors.darkFailedColor,

      // Background Colors
      background: AppColors.darkBgPrimaryColor,
      onBackground: AppColors.darkTitleColor,

      // Surface Colors
      surface: AppColors.darkBgSecondaryColor,
      onSurface: AppColors.darkSubtitleColor,
      surfaceVariant: AppColors.darkSeparatorColor,
      onSurfaceVariant: AppColors.darkDefaultBorderColor,

      // Outline Colors
      outline: AppColors.darkActiveBorderColor,
      outlineVariant: AppColors.darkDefaultBorderColor,

      // Shadow
      shadow: AppColors.darkShadowColor,

      // Inverse Colors
      inverseSurface: AppColors.darkBlue08Color,
      onInverseSurface: AppColors.darkBlueTextColor,
      inversePrimary: AppColors.darkHoverPressingButtonColor,

      // Scrim
      scrim: AppColors.darkLayoutColor,
    ),

    /// **** Filled Button Theme ****
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        overlayColor: const WidgetStatePropertyAll(
          AppColors.darkHoverPressingButtonColor,
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(AppSizes.phoneWidth, AppHeight.h48),
        ),
      ),
    ),

    /// **** Progress Indicator Theme ****
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkWhiteTextColor,
      circularTrackColor: Colors.transparent,
    ),
  );
}
