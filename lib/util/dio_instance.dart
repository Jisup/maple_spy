import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  final dio = Dio();

  DioInstance() {
    dio.options.baseUrl = dotenv.get('NEXON_API_URL');
    dio.options.headers = {
      'accept': 'application/json',
      'x-nxopen-api-key': dotenv.get('NEXON_API_KEY'),
    };
    dio.interceptors
        .add(LogInterceptor(logPrint: (o) => debugPrint(o.toString())));
  }

  void setQueryParameters(queryParameter) {
    dio.options.queryParameters = queryParameter;
  }
}
