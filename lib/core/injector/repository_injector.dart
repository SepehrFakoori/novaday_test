import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/features/onboarding/data/datasource/comment_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';
import 'package:novaday_test/features/onboarding/data/repository/post_repository_impl.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';

class RepositoryInjector {
  static void injector() {
    final KiwiContainer container = KiwiContainer();

    container.registerFactory<PostRepository>(
      (c) => PostRepositoryImpl(
        c.resolve<ICommentDataSource>(),
        c.resolve<IPostDataSource>(),
      ),
    );
  }
}
