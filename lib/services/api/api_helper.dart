import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/services/api/response_data.dart';

// ignore: constant_identifier_names
enum Method { GET, POST, PUT, DELETE }

abstract class IApiHelper {
  String get baseUrl;
  Dio get dio;
  Future<ResponseData> makeCall(
    BuildContext? context, {
    required path,
    Method method = Method.GET,
    required Map<String, dynamic> body,
    bool isFormData = false,
  });
}
