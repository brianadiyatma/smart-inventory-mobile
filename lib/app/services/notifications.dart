import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class NotificationsService {
  final DioClient _dioClient = DioClient();
  Future<Response> getNotif(
      {required token, Map<String, dynamic> params = const {"page": 1}}) async {
    Response response = await _dioClient.get(
        url: '/notifikasi', token: token, queryParams: params);
    return response;
  }
}
