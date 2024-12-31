import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/injector/injector.dart';
import 'package:novaday_test/features/auth/presentations/cubits/login_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/pages/login_screen.dart';
import 'package:novaday_test/features/auth/presentations/pages/otp_screen.dart';
import 'package:novaday_test/features/auth/presentations/pages/biometric_auth_screen.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/splash_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_locale_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_profile_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_theme_screen.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final di = KiwiContainer();

    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SplashCubit(di.resolve<PostRepository>()),
            child: const SplashScreen(),
          ),
        );
      case AppRoutes.setLocaleScreen:
        return MaterialPageRoute(builder: (_) => const SetLocaleScreen());
      case AppRoutes.setThemeScreen:
        return MaterialPageRoute(builder: (_) => const SetThemeScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case AppRoutes.otpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OtpCubit(),
                  child: OtpScreen(phoneNumber: args as String),
                ));
      case AppRoutes.setBiometricAuthScreen:
        return MaterialPageRoute(builder: (_) => const BiometricAuthScreen());
      case AppRoutes.profileScreen:
        return MaterialPageRoute(builder: (_) => const SetProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SetLocaleScreen());
      // case '/set-theme':
      //   return MaterialPageRoute(
      //     builder: (_) => DetailsPage(data: args),
      //     settings: settings,
      //   );
    }
  }

// static Future<T?> navigateTo<T>(
//   BuildContext context,
//   String routeName, {
//   Object? arguments,
//   NavigationTypeEnum navigateType = NavigationTypeEnum.push,
// }) {
//   switch (navigateType) {
//     case NavigationTypeEnum.push:
//       return context.navigator.pushNamedAndRemoveUntil<T>(
//         routeName,
//         (route) => false,
//         arguments: arguments,
//       );
//     case NavigationTypeEnum.pushReplacement:
//       return context.navigator.pushReplacementNamed(
//         routeName,
//         arguments: arguments,
//       );
//     default:
//       return context.navigator.pushNamed<T>(
//         routeName,
//         arguments: arguments,
//       );
//   }
// }
}
