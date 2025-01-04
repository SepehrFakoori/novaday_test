import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final Connectivity _connectivity;

  AppInterceptor(this._connectivity);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
        DioException.connectionError(
            requestOptions: options, reason: "No Internet Connection"),
      );
    }
    return super.onRequest(options, handler);
  }
}
