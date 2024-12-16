import 'package:flutter/material.dart';
import 'package:novaday_test/core/theme/app_themes.dart';
import 'package:novaday_test/features/splash/presentations/language_selection_screen.dart';
import 'package:novaday_test/features/splash/presentations/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightThemeData,
      home: const Directionality(
          textDirection: TextDirection.rtl,
          child: LanguageSelectionScreen()),
    );
  }
}
