import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class GudangService {
  final DioClient _dioClient = DioClient();

  Future<Response> getLoc({required token}) async {
    Response response =
        await _dioClient.get(url: '/request-location', token: token);

    return response;
  }

  Future<Response> getType(
      {required token, required Map<String, dynamic> queryparams}) async {
    Response response = await _dioClient.get(
        url: '/request-type', queryParams: queryparams, token: token);

    return response;
  }

  Future<Response> getBin(
      {required token, required Map<String, dynamic> queryparams}) async {
    Response response = await _dioClient.get(
        url: '/request-type-bin', queryParams: queryparams, token: token);

    return response;
  }

  Future<Response> getStorage(
      {required token, Map<String, dynamic>? queryparams}) async {
    Response response = await _dioClient.get(
        url: '/storage', token: token, queryParams: queryparams);
    return response;
  }
}
