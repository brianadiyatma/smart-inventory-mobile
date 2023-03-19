import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class MaterialService {
  final DioClient _dioClient = DioClient();

  Future<Response> getMaterial(
      {required token, Map<String, dynamic>? queryparams}) async {
    Response response = await _dioClient.get(
        url: '/materials', token: token, queryParams: queryparams);
    return response;
  }

  Future<Response> getMaterialLocation(
      {required token, Map<String, dynamic>? queryParams}) async {
    Response response = await _dioClient.get(
        url: '/materials/storage', token: token, queryParams: queryParams);
    return response;
  }

  Future<Response> getMaterialHistory(
      {required token, Map<String, dynamic>? queryParams}) async {
    Response response = await _dioClient.get(
        url: '/materials/history', token: token, queryParams: queryParams);
    return response;
  }
}
