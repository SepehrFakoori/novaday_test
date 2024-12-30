import 'package:novaday_test/core/injector/datasource_injector.dart';
import 'package:novaday_test/core/injector/repository_injector.dart';
import 'package:novaday_test/core/injector/service_injector.dart';

class Injector {
  static void injector() {
    ServiceInjector.injector();
    DataSourceInjector.injector();
    RepositoryInjector.injector();
  }
}
