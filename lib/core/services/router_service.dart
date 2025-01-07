import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/NavigateProfileFromEnum.dart';
import 'package:novaday_test/features/auth/presentations/cubits/login_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/pages/login_screen.dart';
import 'package:novaday_test/features/auth/presentations/pages/otp_screen.dart';
import 'package:novaday_test/features/auth/presentations/pages/biometric_auth_screen.dart';
import 'package:novaday_test/features/auth/presentations/utils/login_arguments.dart';
import 'package:novaday_test/features/dashboard/domain/repository/home_repository.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/main_screen.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/comments_screen.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/home_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/splash_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_locale_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/profile_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/pages/set_theme_screen.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final di = KiwiContainer();

    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SplashCubit(
              di.resolve<PostRepository>(),
            ),
            child: const SplashScreen(),
          ),
        );

      case AppRoutes.setLocaleScreen:
        return MaterialPageRoute(
          builder: (_) => SetLocaleScreen(
            navigateFrom: args as NavigateProfileFromEnum,
          ),
        );

      case AppRoutes.setThemeScreen:
        return MaterialPageRoute(
          builder: (_) => SetThemeScreen(
            navigateFrom: args as NavigateProfileFromEnum,
          ),
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );

      case AppRoutes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OtpCubit(),
            child: OtpScreen(loginArguments: args as LoginArguments),
          ),
        );

      case AppRoutes.setBiometricAuthScreen:
        return MaterialPageRoute(
          builder: (_) => const BiometricAuthScreen(),
        );

      case AppRoutes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );

      case AppRoutes.profileScreen:
        return MaterialPageRoute(
          builder: (_) =>
              ProfileScreen(navigateFrom: args as NavigateProfileFromEnum),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            homeRepository: di.resolve<HomeRepository>(),
          ),
        );

      case AppRoutes.commentScreen:
        return MaterialPageRoute(
          builder: (_) => CommentsScreen(
            postId: args as int,
            homeRepository: di.resolve<HomeRepository>(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SetLocaleScreen(
            navigateFrom: NavigateProfileFromEnum.onboarding,
          ),
        );
    }
  }
}
