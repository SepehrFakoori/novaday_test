import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';
import 'package:novaday_test/core/theme/app_light_theme.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_language_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeEnum>(
            builder: (context, themeMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: LightThemeData.themeData,
                // darkTheme: DarkThemeData.themeData,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                home: const SetLanguageScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
