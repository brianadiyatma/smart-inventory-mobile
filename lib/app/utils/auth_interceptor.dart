import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer 123456';
    return options;
  }
}
