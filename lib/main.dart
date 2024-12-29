import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/core/constants/app_routes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/services/router_service.dart';
import 'package:novaday_test/core/theme/app_dark_theme.dart';
import 'package:novaday_test/core/theme/app_light_theme.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/locale_cubit/locale_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.settingBox);
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
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Padding(
                    padding: constraints.maxWidth > 840
                        ? EdgeInsets.symmetric(horizontal: context.width * 0.3)
                        : const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sp0),
                    child: MaterialApp(
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
                      initialRoute: AppRoutes.splashScreen,
                      home: const SplashScreen(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
