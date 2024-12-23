import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/services/api/api_helper.dart';
import 'package:optimally_me_app/services/api/api_interceptor.dart';
import 'package:optimally_me_app/services/api/response_data.dart';

class ApiClient implements IApiHelper {
  ApiClient._();

  static final ApiClient init = ApiClient._();

  factory ApiClient() {
    return init;
  }

  @override
  String get baseUrl {
    if (kDebugMode) {
      return 'https://dummyjson.com'; // Development URL
    } else if (kReleaseMode) {
      return 'https://dummyjson.com'; // Production URL
    } else if (kProfileMode) {
      return 'https://dummyjson.com'; // Profiling URL
    } else {
      return '';
    }
  }

  @override
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
        ),
      )..interceptors.add(ApiInterceptor());

  @override
  Future<ResponseData> makeCall(BuildContext? context,
      {required path,
      Method method = Method.GET,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      return await dio
          .requestUri(Uri(path: path).replace(queryParameters: queryParameters),
              data: isFormData ? FormData.fromMap(body ?? {}) : body,
              options: Options(
                method: method.name,
              ))
          .then((response) {
        // context == null
        //     ? null
        //     : showSnackMessage(context,
        //         status: response.data['status'],
        //         message: response.data['message']);

        if (response.statusCode == 200 || response.statusCode == 304) {
          return ResponseData.fromJson(response.data);
        }

        return ResponseData(status: 500, message: 'Something went wrong');
      });
    } on DioException catch (e) {
      // context == null
      //     ? null
      //     : showSnackMessage(
      //         context,
      //         status: e.response?.statusCode ?? 200,
      //         message: e.response?.statusMessage,
      //       );
      return ResponseData(status: 500, message: e.message);
    }
  }
}
