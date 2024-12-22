import 'package:flutter/material.dart';
import 'package:novaday_test/core/theme/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_profile_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppThemes().init(context); // Initialize the phone theme properties

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.darkThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('fa'),
      home: const SetProfileScreen(),
    );
  }
}
