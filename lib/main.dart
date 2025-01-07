import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/injector/injector.dart';
import 'package:novaday_test/core/services/router_service.dart';
import 'package:novaday_test/core/theme/app_dark_theme.dart';
import 'package:novaday_test/core/theme/app_light_theme.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/main_screen.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/user_entity/user_entity.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/locale_cubit/locale_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Injector.injector();
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.settingBox);
  Hive.registerAdapter(CommentEntityAdapter());
  await Hive.openBox<CommentEntity>(HiveBoxConstants.commentsBox);
  Hive.registerAdapter(PostEntityAdapter());
  await Hive.openBox<PostEntity>(HiveBoxConstants.postsBox);
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<UserEntity>(HiveBoxConstants.userProfileBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final di = KiwiContainer();

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
                  return MaterialApp(
                    builder: (context, child) => ResponsiveBreakpoints.builder(
                      child: child!, breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                    ],
                    ),
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigatorKey,
                    title: 'Flutter Demo',
                    theme: themeEnum == ThemeEnum.light
                        ? LightThemeData.themeData
                        .copyWith(textTheme: getTextTheme(locale))
                        : DarkThemeData.themeData
                        .copyWith(textTheme: getTextTheme(locale)),
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: locale,
                    onGenerateRoute: RouterService.generateRoute,
                    initialRoute: AppRoutes.mainScreen,
                    home: const MainScreen(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  TextTheme getTextTheme(locale) {
    if (locale.languageCode == LanguageEnum.fa.name ||
        locale.languageCode == 'ar') {
      return AppTextStyles.nonLatinTextTheme;
    } else {
      return AppTextStyles.latinTextTheme;
    }
  }
}
