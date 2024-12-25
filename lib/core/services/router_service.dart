import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/extensions/navigator_extension.dart';
import 'package:novaday_test/features/auth/presentations/cubits/login_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/pages/login_screen.dart';
import 'package:novaday_test/features/auth/presentations/pages/otp_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_language_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_theme_screen.dart';

class RouterService {
  // Generate Routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/set-language':
        return MaterialPageRoute(builder: (_) => const SetLanguageScreen());
      case '/set-theme':
        return MaterialPageRoute(builder: (_) => const SetThemeScreen());
      case '/login':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case '/otp':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OtpCubit(),
                  child: const OtpScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const SetLanguageScreen());
      // case '/set-theme':
      //   return MaterialPageRoute(
      //     builder: (_) => DetailsPage(data: args),
      //     settings: settings,
      //   );
    }
  }

  // Navigate with name (pushedNamed)
  static Future<T?> navigateTo<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return context.navigator.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  // For pop
  static void pop(BuildContext context) => context.navigator.pop();

// Navigating with animation
// static void navigateWithAnimation(
//   BuildContext context,
//   Widget page, {
//   Duration duration = const Duration(milliseconds: 200),
// }) {
//   context.navigator.push(
//     PageRouteBuilder(
//       pageBuilder: (_, __, ___) => page,
//       transitionDuration: duration,
//       transitionsBuilder: (_, animation, __, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//     ),
//   );
// }
}
