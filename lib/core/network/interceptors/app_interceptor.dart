import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/main.dart';

class ConnectivityInterceptor extends Interceptor {
  final BuildContext context = navigatorKey.currentState!.overlay!.context;
  final Connectivity _connectivity = Connectivity();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kIsWeb) {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        customFlushBar(
          context,
          messageText: context.localization.offlineAlert,
          isError: true,
        );
        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.cancel,
            error: 'No internet connection',
          ),
        );
      }
    } else {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          handler.next(options);
        } else {
          customFlushBar(
            context,
            messageText: context.localization.offlineAlert,
            isError: true,
          );
          handler.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.cancel,
              error: 'No internet connection',
            ),
          );
        }
      } on Exception {
        customFlushBar(
          context,
          messageText: context.localization.offlineAlert,
          isError: true,
        );
      }
    }
  }
}
