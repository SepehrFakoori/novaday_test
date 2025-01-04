import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/network/interceptors/app_interceptor.dart';

class ConnectivityService {
  var di = KiwiContainer();
  late Dio _dio;
  final Connectivity _connectivity = Connectivity();

  ConnectivityService() {
    _dio = di.resolve<Dio>();
    _dio.interceptors.add(AppInterceptor(_connectivity));
  }
}
