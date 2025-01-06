import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/network/interceptors/app_interceptor.dart';

class ServiceInjector {
  static void injector() {
    KiwiContainer container = KiwiContainer();

    container.registerSingleton<ConnectivityInterceptor>(
          (c) => ConnectivityInterceptor(),
    );

    container.registerSingleton<Dio>(
      (c) => Dio(
        BaseOptions(baseUrl: AppConstants.baseUrl),
      )..interceptors.add(c.resolve<ConnectivityInterceptor>()),
    );
  }
}
