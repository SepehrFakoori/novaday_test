import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';

class DataSourceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerFactory<IPostDataSource>(
        (container) => PostRemoteDataSource(container.resolve<Dio>()));
  }
}
