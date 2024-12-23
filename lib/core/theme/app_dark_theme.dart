import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/theme/app_dark_colors.dart';

class DarkThemeData {
  static ThemeData themeData = ThemeData(
    // Scaffold Background Color
    scaffoldBackgroundColor: AppDarkColors.backgroundPrimaryColor,

    // Filled Button Theme
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          AppDarkColors.hoverPressingButtonColor,
        ),
      ),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBarrierColor: AppDarkColors.layoutColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppDarkColors.primaryColor,
      circularTrackColor: AppDarkColors.separatorColor,
    ),

    // Colors Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppDarkColors.primaryColor,
      onPrimary: AppDarkColors.whiteTextColor,
      surface: AppDarkColors.backgroundPrimaryColor,
      onSurface: AppDarkColors.titleColor,
      secondary: AppDarkColors.backgroundSecondaryColor,
      onSecondary: AppDarkColors.titleColor,
      onSecondaryContainer: AppDarkColors.subtitleColor,
      outlineVariant: AppDarkColors.defaultBorderColor,
      secondaryContainer: AppDarkColors.blue08Color,
      tertiaryContainer: AppDarkColors.deActiveButtonColor,
      onTertiaryContainer: AppDarkColors.disabledTextColor,
      onPrimaryFixed: AppDarkColors.hoverPressingButtonColor,
      tertiary: AppDarkColors.backgroundTertiaryColor,
      onError: AppDarkColors.dangerColor,
      outline: AppDarkColors.defaultBorderColor,
    ),
  );
}
