import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/features/dashboard/data/datasource/home_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/comment_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';

class DataSourceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerFactory<IPostDataSource>(
      (c) => PostDataSource(c.resolve<Dio>()),
    );

    container.registerFactory<ICommentDataSource>(
      (c) => CommentDataSource(c.resolve<Dio>()),
    );

    container.registerFactory<IHomeDataSource>(
      (c) => HomeDataSource(c.resolve<Dio>()),
    );
  }
}
