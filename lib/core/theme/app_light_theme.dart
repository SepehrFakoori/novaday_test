import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/theme_constants/app_light_colors.dart';

class LightThemeData {
  static ThemeData themeData = ThemeData(
    // Scaffold Background Color
    scaffoldBackgroundColor: AppLightColors.backgroundPrimaryColor,

    textTheme: const TextTheme(),

    // Filled Button Theme
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          AppLightColors.hoverPressingButtonColor,
        ),
      ),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBarrierColor: AppLightColors.layoutColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppLightColors.primaryColor,
      circularTrackColor: AppLightColors.separatorColor,
    ),

    // Colors Scheme
    colorScheme: const ColorScheme.light(
      primary: AppLightColors.primaryColor,
      onPrimary: AppLightColors.whiteTextColor,
      surface: AppLightColors.backgroundPrimaryColor,
      onSurface: AppLightColors.titleColor,
      secondary: AppLightColors.backgroundSecondaryColor,
      onSecondary: AppLightColors.titleColor,
      onSecondaryContainer: AppLightColors.subtitleColor,
      outlineVariant: AppLightColors.defaultBorderColor,
      secondaryContainer: AppLightColors.blue08Color,
      tertiaryContainer: AppLightColors.deActiveButtonColor,
      onTertiaryContainer: AppLightColors.disabledTextColor,
      onPrimaryFixed: AppLightColors.hoverPressingButtonColor,
      tertiary: AppLightColors.backgroundTertiaryColor,
      onError: AppLightColors.dangerColor,
      outline: AppLightColors.defaultBorderColor,
      surfaceTint: AppLightColors.successColor,
    ),
  );
}
