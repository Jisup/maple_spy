import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  static final DioInstance _instance = DioInstance._internal();
  late Dio dio;

  DioInstance._internal() {
    dio = Dio();
    dio.options.baseUrl = dotenv.get('NEXON_API_URL');
    dio.options.headers = {
      'accept': 'application/json',
      'x-nxopen-api-key': dotenv.get('NEXON_API_KEY'),
    };
    // dio.interceptors
    //     .add(LogInterceptor(logPrint: (o) => debugPrint(o.toString())));
  }

  factory DioInstance() {
    return _instance;
  }
}
