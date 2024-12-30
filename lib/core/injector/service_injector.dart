import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

class ServiceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerSingleton<Dio>(
      (container) => Dio(
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
      ),
    );
  }
}
