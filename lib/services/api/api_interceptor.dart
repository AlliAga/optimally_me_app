import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //!TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("Response: ${jsonEncode(response.data)}");
    }

    if (response.statusCode == 200) {}
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("On Error Response");
    }

    if (err.response?.statusCode == 500) {
      if (kDebugMode) {
        print("ERROR(500): ${err.response?.statusMessage}");
      }
    }

    return super.onError(err, handler);
  }
}
