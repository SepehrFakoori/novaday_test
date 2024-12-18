import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/cubits/filled_button_widget_cubit.dart';
import 'package:novaday_test/core/theme/app_themes.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/set_language_screen.dart';

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
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ButtonCubit>(
              create: (BuildContext context) {
                var buttonCubit = ButtonCubit();
                buttonCubit.buttonActive();
                return buttonCubit;
              },
            ),
            BlocProvider(
              create: (BuildContext context) => LanguageCubit(),
            ),
          ],
          child: const SetLanguageScreen(),
        ),
      ),
    );
  }
}

/// Directionality(
//         textDirection: TextDirection.rtl,
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider(create: (BuildContext context) {
//               var buttonCubit = ButtonCubit();
//               buttonCubit.buttonActive();
//               return buttonCubit;
//             })
//           ],
//           child: const SetThemeScreen(),
//         ),
//       ),
/// Directionality(
//         textDirection: TextDirection.rtl,
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider<ButtonCubit>(
//               create: (BuildContext context) {
//                 var buttonCubit = ButtonCubit();
//                 buttonCubit.buttonActive();
//                 return buttonCubit;
//               },
//             ),
//             BlocProvider(
//               create: (BuildContext context) => LanguageCubit(),
//             ),
//           ],
//           child: const SetLanguageScreen(),
//         ),
//       ),
///
