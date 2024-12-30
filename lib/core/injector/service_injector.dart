import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kiwi/kiwi.dart';

class ServiceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerSingleton<Dio>(
      (container) => Dio(
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
      ),
    );

    container.registerInstance((container) async => await Hive.initFlutter());
  }
}
