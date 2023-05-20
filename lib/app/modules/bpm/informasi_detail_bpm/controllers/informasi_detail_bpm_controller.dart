import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/informasi_detail_bpm.dart';
import '../../../../services/bpm_service.dart';
import '../../../../widgets/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class InformasiDetailBpmController extends GetxController {
  final box = GetStorage();
  final id = Get.arguments['id'];
  final TextEditingController kuantitasController = TextEditingController();
  Rx<InformasiDetailBPM> informasiDetailBPM = InformasiDetailBPM().obs;
  RxBool isLoading = true.obs;
  RxString error = "".obs;
  RxBool isLoadingButton = false.obs;
  final RxString qtyCurrentItem = "".obs;
  final Rx<File> image = File('').obs;

  RxString bin = "".obs;
  TextEditingController binController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    fetchInfoBPM();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchInfoBPM() async {
    error.value = '';
    isLoading.value = true;

    try {
      Response response =
          await BPMService().fetchInfoBPM(box.read('token'), id.toString());
      if (response.statusCode == 200) {
        informasiDetailBPM.value = InformasiDetailBPM.fromJson(response.data);
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

  void postData() async {
    // print(loc.value);
    // print(type.value);

    isLoadingButton.value = true;
    if (bin.value == "" && kuantitasController.text == "") {
      CustomSnackbar.snackbarFailed(
          title: "Error", message: "Data must not empty");
      isLoadingButton.value = false;
    } else if (int.tryParse(kuantitasController.text.toString())! >
            (informasiDetailBPM.value.data!.detail!.qtyLeft)! ||
        (int.tryParse(kuantitasController.text.toString()))! >
            (int.parse(qtyCurrentItem.value))) {
      CustomSnackbar.snackbarFailed(
          title: "Error", message: "Quantity is not correct");
      isLoadingButton.value = false;
    } else {
      try {
        Response response;
        if (image.value.path == null) {
          response = await BPMService().postInfoBPM(
              token: box.read('token'),
              body: FormData.fromMap({
                "id": id,
                "material_code":
                    informasiDetailBPM.value.data?.detail!.materialCode,
                "bin_code": bin.value,
                "qty_out": kuantitasController.text,
                "foto": await MultipartFile.fromFile(image.value.path,
                    filename: image.value.path.split('/').last),
              }));
        } else {
          response = await BPMService().postInfoBPM(
              token: box.read('token'),
              body: FormData.fromMap({
                "id": id,
                "material_code":
                    informasiDetailBPM.value.data?.detail!.materialCode,
                "bin_code": bin.value,
                "qty_out": kuantitasController.text,
              }));
        }

        if (response.statusCode == 200) {
          Get.arguments['refresh']();
          Get.back();
          CustomSnackbar.snackbarSuccess(
              title: "Success", message: "Data has been added");
        } else {
          error.value = response.statusMessage.toString();
          CustomSnackbar.snackbarFailed(
              title: "Error", message: error.value.toString());
          Get.back();
        }
      } on DioError catch (e) {

        if (e.response?.statusCode == 404) {
        } else if (e.response?.statusCode == 401) {
          Get.offAndToNamed('/login');
          error.value = "Token is Not Valid";
          CustomSnackbar.snackbarFailed(
              title: "Login Status: ", message: "Login expired");
        } else {
          CustomSnackbar.snackbarFailed(
              title: "Error", message: "Something went wrong  [${e.message}]");
        }
      } finally {
        isLoadingButton.value = false;
      }
      // print(bin.value);
      // print(kuantitasController.text);
    }
  }

  pickImageC() async {
    print(this.image.value);
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      print(this.image.value);
      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      print(this.image.value);
      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
