import 'package:dio/dio.dart';
import 'package:inka_smart_inventory_mobile/app/utils/dio_utils.dart';

class TransactionService {
  final DioClient _dioClient = DioClient();

  Future<Response> getTransactionList(
      {required String token,
      Map<String, dynamic>? query = const {'page': 1}}) async {
    Response response =
        await _dioClient.get(url: '/dokumen', token: token, queryParams: query);
    return response;
  }

  Future<Response> getMyTransaction(
      {required String token,
      Map<String, dynamic>? query = const {'page': 1}}) async {
    Response response = await _dioClient.get(
        url: '/my-transaction/list', token: token, queryParams: query);
    return response;
  }
}
