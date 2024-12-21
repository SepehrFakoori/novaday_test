import 'package:flutter/material.dart';
import 'package:novaday_test/core/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle _base = TextStyle(
    fontFamily: 'IranYekan',
    fontStyle: FontStyle.normal,
  );
  static final textTheme = TextTheme(
    displayLarge: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 36.0,
    ),
    displayMedium: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 32.0,
    ),
    displaySmall: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 28.0,
    ),
    headlineMedium: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),
    headlineSmall: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
    ),
    titleLarge: _base.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: AppColors.lightTitleColor,
    ),
    titleMedium: _base.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
    titleSmall: _base.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
    bodyLarge: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    bodyMedium: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
    ),
    bodySmall: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
    ),
    labelLarge: _base.copyWith(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
    ),
    labelSmall: _base.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10.0,
    ),
  );
}
