import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class DashboardProvider {
  final DioClient _dioClient = DioClient();

  // Future<Response> getHeader({required String token, String? query}) async {
  //   Response response =
  //       await _dioClient.get(url: '/dokumen/count?query=$query', token: token);
  //   return response;
  // }

  // Future<Response> getTransactionSection(String token) async {
  //   Response response =
  //       await _dioClient.get(url: '/dokumen/transaksi-hari', token: token);
  //   return response;
  // }

  // Future<Response> getTransactionSectionNotProcess(String token) async {
  //   Response response =
  //       await _dioClient.get(url: '/dokumen/transaksi-belum', token: token);
  //   return response;
  // }

  // Future<Response> getMaterialInformation(String token) async {
  //   Response response =
  //       await _dioClient.get(url: '/dokumen/material', token: token);
  //   return response;
  // }

  Future<Response> getDashboardInformation(
      {required String token, Map<String, dynamic>? query}) async {
    Response response = await _dioClient.get(
        url: '/dashboard', token: token, queryParams: query);
    return response;
  }
}
