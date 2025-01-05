import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/features/dashboard/data/datasource/home_datasource.dart';
import 'package:novaday_test/features/dashboard/data/repository/home_repository_impl.dart';
import 'package:novaday_test/features/dashboard/domain/repository/home_repository.dart';
import 'package:novaday_test/features/onboarding/data/datasource/comment_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';
import 'package:novaday_test/features/onboarding/data/repository/post_repository_impl.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';

class RepositoryInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerFactory<PostRepository>(
      (c) => PostRepositoryImpl(
        c.resolve<ICommentDataSource>(),
        c.resolve<IPostDataSource>(),
      ),
    );

    container.registerFactory<HomeRepository>(
      (c) => HomeRepositoryImpl(
        c.resolve<IHomeDataSource>(),
      ),
    );
  }
}
