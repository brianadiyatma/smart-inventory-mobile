import '../utils/dio_utils.dart';
import 'package:dio/dio.dart';

class BPMService {
  Future<Response> fetchBPM(String token, String barcode) async {
    Response response = await DioClient()
        .get(url: '/dokumen/scan?query=$barcode', token: token);

    return response;
  }

  Future<Response> fetchInfoBPM(String token, String id) async {
    Response response =
        await DioClient().get(url: '/info-bpm?id=$id', token: token);

    return response;
  }

  Future<Response> doneBPM(String token, Map<String, dynamic> body) async {
    Response response =
        await DioClient().post(url: '/bpm-done', data: body, token: token);

    return response;
  }

  Future<Response> postInfoBPM({required token, required FormData body}) async {
    Response response =
        await DioClient().postFile(url: '/bpm-post', data: body, token: token);

    return response;
  }

  Future<Response> postStorageDest({required token, required body}) async {
    Response response = await DioClient()
        .post(url: '/bpm-destination', data: body, token: token);

    return response;
  }
}
