import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_cubit.dart';

class CubitInjector {
  static void injector() {
    final KiwiContainer container = KiwiContainer();

    container.registerFactory<SplashCubit>(
          (c) => SplashCubit(
        c.resolve<PostRepository>(),
      ),
    );
  }
}
