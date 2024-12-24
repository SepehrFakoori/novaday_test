import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/core/constants/app_constants.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';
import 'package:novaday_test/core/services/router_service.dart';
import 'package:novaday_test/core/theme/app_dark_theme.dart';
import 'package:novaday_test/core/theme/app_light_theme.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_language_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.settingBoxDb);
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
            builder: (context, themeEnum) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: themeEnum == ThemeEnum.light
                    ? LightThemeData.themeData
                    : DarkThemeData.themeData,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                onGenerateRoute: RouterService.generateRoute,
                initialRoute: '/set-language',
                home: const SetLanguageScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
