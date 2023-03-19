import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/sttp_service.dart';
import '../../../../data/detail_transaksi_sttp.dart';
import 'package:dio/dio.dart';

class DetailTransaksiSttpController extends GetxController {
  final count = 0.obs;
  var docNum = Get.arguments['docNum'];
  final box = GetStorage();
  Rx<STTPInformasiDetail> sttpInformasiDetail = STTPInformasiDetail().obs;
  RxBool isLoading = true.obs;
  RxString error = "".obs;
  RxBool isLoadingButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSTTP();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSTTP() async {
    isLoading.value = true;
    error.value = '';

    try {
      Response response =
          await STTPService().fetchSTTP(box.read('token'), docNum);
      if (response.statusCode == 200) {
        STTPInformasiDetail sttpInformasiDetail =
            STTPInformasiDetail.fromJson(response.data);
        this.sttpInformasiDetail.value = sttpInformasiDetail;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        error.value = "Data not found";
      } else if (e.response?.statusCode == 401) {
        Get.offAndToNamed('/login');
        error.value = "Token not valid";

        CustomSnackbar.snackbarFailed(
            title: "Login Status: ",
            message: "Your login token is invalid, please login again");
      } else {
        print(e.message);
        error.value = "There is an error (${e.message})";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void postTransactionComplete() async {
    isLoadingButton.value = true;
    error.value = '';

    try {
      Response response = await STTPService().doneSTTP(box.read('token'), {
        "id": sttpInformasiDetail.value.data!.id,
      });
      if (response.statusCode == 200) {
        Get.arguments['refreshes']();
        Get.back();
        print('hgghgh');
        CustomSnackbar.snackbarSuccess(
            title: "Done: ", message: "Transaction Done");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        error.value = "Data not found";
      } else if (e.response?.statusCode == 401) {
        Get.offAndToNamed('/login');
        error.value = "Token not valid";

        CustomSnackbar.snackbarFailed(
            title: "Login Status: ",
            message: "Your login token is invalid, please login again");
      } else {
        error.value = "There is an error (${e.message})";
      }
    } finally {
      isLoadingButton.value = false;
    }
  }
}
