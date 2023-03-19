import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class STTPService {
  Future<Response> fetchSTTP(String token, String barcode) async {
    Response response = await DioClient()
        .get(url: '/dokumen/scan?query=$barcode', token: token);

    return response;
  }

  Future<Response> fetchInfoSTTP(String token, String id) async {
    Response response =
        await DioClient().get(url: '/info-sttp?id=$id', token: token);

    return response;
  }

  Future<Response> doneSTTP(String token, Map<String, dynamic> body) async {
    Response response =
        await DioClient().post(url: '/sttp-done', data: body, token: token);

    return response;
  }

  Future<Response> postInfo({required token, required FormData body}) async {
    Response response =
        await DioClient().postFile(url: '/sttp-post', data: body, token: token);

    return response;
  }
}
