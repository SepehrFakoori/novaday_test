import 'package:flutter/material.dart';
import 'package:novaday_test/core/extensions/navigator_extension.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_language_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_theme_screen.dart';

class RouterService {
  // Generate Routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/set-language':
        return MaterialPageRoute(builder: (_) => const SetLanguageScreen());
      // case '/set-theme':
      //   return MaterialPageRoute(
      //     builder: (_) => DetailsPage(data: args),
      //     settings: settings,
      //   );
      case '/set-theme':
        return MaterialPageRoute(builder: (_) => const SetThemeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const SetLanguageScreen(),
        );
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

  // Navigating with animation
  static void navigateWithAnimation(
    BuildContext context,
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    context.navigator.push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  // For pop
  static void pop(BuildContext context) {
    context.navigator.pop();
  }
}
