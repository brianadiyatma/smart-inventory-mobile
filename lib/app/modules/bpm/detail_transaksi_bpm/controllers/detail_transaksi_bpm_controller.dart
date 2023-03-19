import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_loc_gudang.dart';
import 'package:inka_smart_inventory_mobile/app/services/gudang_service.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/bpm_service.dart';
import 'package:inka_smart_inventory_mobile/app/data/detail_transaksi_bpm.dart';
import 'package:dio/dio.dart';

class DetailTransaksiBpmController extends GetxController {
  final docNum = Get.arguments['docNum'];
  final box = GetStorage();
  Rx<BPMInformasiDetail> bpmInformasiDetail = BPMInformasiDetail().obs;
  RxBool isLoading = true.obs;
  RxString error = "".obs;
  RxBool isLoadingButton = false.obs;

//Destination
  RxBool isLoadingLoc = true.obs;
  Rx<Loc> dataLoc = Loc().obs;

  @override
  void onInit() {
    super.onInit();
    getBPM();
    getLocGudang();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getBPM() async {
    isLoading.value = true;
    error.value = '';

    try {
      Response response =
          await BPMService().fetchBPM(box.read('token'), docNum);
      if (response.statusCode == 200) {
        BPMInformasiDetail bpmInformasiDetail =
            BPMInformasiDetail.fromJson(response.data);
        this.bpmInformasiDetail.value = bpmInformasiDetail;
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
        error.value = "There is an error (${e.response?.statusCode})";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void postTransactionComplete() async {
    isLoadingButton.value = true;
    error.value = '';

    try {
      Response response = await BPMService().doneBPM(box.read('token'), {
        "id": bpmInformasiDetail.value.data!.id,
      });
      if (response.statusCode == 200) {
        Get.arguments['refreshes']();
        Get.back();
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
        print(e.message);
        error.value = "There is an error (${e.response?.statusCode})";
      }
    } finally {
      isLoadingButton.value = false;
    }
  }

  void getLocGudang() async {
    try {
      isLoading.value = true;
      Response response =
          await GudangService().getLoc(token: box.read('token'));
      if (response.statusCode == 200) {
        Loc dataLocation = Loc.fromJson(response.data);
        dataLoc.value = dataLocation;
      } else {
        error.value = response.statusMessage.toString();
        CustomSnackbar.snackbarFailed(
            title: "Error", message: error.value.toString());
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        error.value = "Data not found";
      } else if (e.response?.statusCode == 401) {
        Get.offAndToNamed('/login');
        error.value = "Token is Not Valid";
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ", message: "Login Expired");
      } else {
        error.value = e.message.toString();
        CustomSnackbar.snackbarFailed(
            title: "Error",
            message: "Something went wrong  ${e.response?.statusCode}");
      }
    } finally {
      isLoadingLoc.value = false;
    }
  }

  void onChangeDestination(e) async {
    try {
      Response response = await BPMService().postStorageDest(
          token: box.read('token'),
          body: {"id": bpmInformasiDetail.value.data!.id, "destination": e});
      if (response.statusCode == 200) {
        CustomSnackbar.snackbarSuccess(
            title: "Success", message: "Destination Changed");
        onInit();
      } else {
        error.value = response.statusMessage.toString();
        CustomSnackbar.snackbarFailed(
            title: "Error", message: error.value.toString());
      }
    } on DioError catch (e) {
      if (e.response!.statusCode != null) {
        CustomSnackbar.snackbarFailed(
            title: "Error", message: e.response!.statusMessage.toString());
        error.value = "Error : " + e.response!.statusCode.toString();
        if (e.response!.statusCode == 401) {
          Get.offAndToNamed('/login');
        }
      } else {
        CustomSnackbar.snackbarFailed(
            title: "Error", message: e.message.toString());
      }
    }
  }
}
