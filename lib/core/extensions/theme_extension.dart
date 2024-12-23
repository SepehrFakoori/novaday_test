import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  // Color Scheme getter
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Text Theme getter
  TextTheme get textTheme => Theme.of(this).textTheme;
}
