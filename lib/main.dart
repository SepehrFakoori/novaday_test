import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/cubits/filled_button_widget_cubit.dart';
import 'package:novaday_test/core/theme/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_language_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_profile_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context); // Initialize the phone size properties
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

///MultiBlocProvider(
//         providers: [
//           BlocProvider<ButtonCubit>(
//             create: (_) {
//               var buttonCubit = ButtonCubit();
//               buttonCubit.buttonActive();
//               return buttonCubit;
//             },
//           ),
//           BlocProvider<LanguageCubit>(
//             create: (_) => LanguageCubit(),
//           ),
//           BlocProvider<ThemeCubit>(
//             create: (_) => ThemeCubit(),
//           ),
//         ],
//         child: const SetLanguageScreen(),
//       ),

///MultiBlocProvider(
//         providers: [
//           BlocProvider<ButtonCubit>(
//             create: (BuildContext context) {
//               var buttonCubit = ButtonCubit();
//               buttonCubit.buttonActive();
//               return buttonCubit;
//             },
//           ),
//           BlocProvider<LanguageCubit>(
//             create: (BuildContext context) {
//               return LanguageCubit();
//             },
//           ),
//           BlocProvider<OtpCubit>(
//             create: (BuildContext context) {
//               return OtpCubit();
//             },
//           ),
//         ],
//         child: const OtpScreen(),
//       ),
