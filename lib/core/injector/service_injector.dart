import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';

class ServiceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerSingleton<Dio>(
      (c) => Dio(
        BaseOptions(baseUrl: AppConstants.baseUrl),
      ),
    );
  }
}
