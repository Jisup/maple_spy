import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maplespy/util/dio_error_interceptor.dart';

class DioInstance {
  static final DioInstance _instance = DioInstance._internal();
  late Dio dio;

  DioInstance._internal() {
    dio = Dio();
    dio.options.baseUrl = dotenv.get('NEXON_API_URL');
    dio.options.headers = {
      'accept': 'application/json',
      // 'x-nxopen-api-key': dotenv.get('NEXON_API_TEST_KEY'),
      'x-nxopen-api-key': dotenv.get('NEXON_API_LIVE_KEY'),
    };
    dio.options.validateStatus = (status) => status != null;
    dio.interceptors.addAll([
      DioErrorInterceptor(),
      // LogInterceptor(logPrint: (o) => debugPrint(o.toString())),
    ]);
  }

  factory DioInstance() {
    return _instance;
  }
}
