import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle _nonLatinBase = TextStyle(
    fontFamily: 'IranYekan',
    fontStyle: FontStyle.normal,
  );

  static final nonLatinTextTheme = TextTheme(
    headlineSmall: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
    titleLarge: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    titleMedium: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodySmall: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelLarge: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _nonLatinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
  );

  static const TextStyle _latinBase = TextStyle(
    fontFamily: 'Mulish',
    fontStyle: FontStyle.normal,
  );

  static final latinTextTheme = TextTheme(
    headlineSmall: _latinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
    titleLarge: _latinBase.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    titleMedium: _latinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: _latinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: _latinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodySmall: _latinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelLarge: _latinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _latinBase.copyWith(
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _latinBase.copyWith(
      fontWeight: FontWeight.w700,
    ),
  );
}
