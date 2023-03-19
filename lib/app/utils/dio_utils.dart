import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioClient {
  static String baseUrl =
      GetStorage().read('ip') == null ? "" : GetStorage().read('ip');
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$baseUrl/api',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      contentType: 'application/json',
    ),
  );

  set setBaseUrl(url) {
    baseUrl = url;
  }

  String get getBaseUrl {
    return baseUrl;
  }

  Future<Response> get(
      {required String url,
      Map<String, dynamic>? queryParams,
      String? token}) async {
    Dio dio = _dio;

    Response response = await dio.get(url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
    return response;
  }

  Future<Response> post(
      {required String url, Map<String, dynamic>? data, String? token}) async {
    Dio dio = _dio;
    // ..interceptors.add(LogInterceptor())
    // ..interceptors.add(AuthInterceptor());
    Response response = await dio.post(url,
        data: data,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        }));
    return response;
  }

  Future<Response> postFile(
      {required String url, FormData? data, String? token}) async {
    Dio dio = _dio;
    // ..interceptors.add(LogInterceptor())
    // ..interceptors.add(AuthInterceptor());
    Response response = await dio.post(url,
        data: data,
        options: Options(sendTimeout: null, receiveTimeout: null, headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        }));
    return response;
  }

  Future<Response> delete(
      {required String url, Map<String, dynamic>? data, String? token}) async {
    Dio dio = _dio;

    Response response = await dio.delete(url,
        data: data,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        }));
    return response;
  }
}
