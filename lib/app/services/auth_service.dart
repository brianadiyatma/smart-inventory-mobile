import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class AuthService {
  final DioClient _dioClient = DioClient();

  Future<Response> login(String email, String password) async {
    Response response = await _dioClient.post(url: '/login', data: {
      'email': email,
      'password': password,
    });

    return response;
  }

  Future<Response> refreshToken(String token) async {
    Response response = await _dioClient.post(url: '/refresh', token: token);

    return response;
  }

  Future<Response> logout(String token) async {
    Response response = await _dioClient.delete(url: '/logout', token: token);

    return response;
  }

  Future<Response> changePassword(
      String token, Map<String, dynamic> data) async {
    Response response = await _dioClient.post(
        url: '/change-password', token: token, data: data);

    return response;
  }

  Future<Response> getProfile(String token) async {
    Response response = await _dioClient.get(url: '/get-user', token: token);

    return response;
  }

  Future<Response> changeProfile(String token, FormData data) async {
    Response response = await _dioClient.postFile(
        url: '/change-photo', token: token, data: data);

    return response;
  }

  Future<Response> getPhoto(String token) async {
    Response response = await _dioClient.get(url: '/get-photo', token: token);

    return response;
  }
}
