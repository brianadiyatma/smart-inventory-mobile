import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_bin_gudang.dart';
import 'package:inka_smart_inventory_mobile/app/modules/sttp/detail_transaksi_sttp/bindings/detail_transaksi_sttp_binding.dart';
import 'package:inka_smart_inventory_mobile/app/modules/sttp/detail_transaksi_sttp/views/detail_transaksi_sttp_view.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/sttp_service.dart';
import '../../../../data/informasi_detail_sttp.dart';
import '../../../../services/gudang_service.dart';
import '../../../../data/data_loc_gudang.dart';
import '../../../../data/data_type_gudang.dart';

class InformasiDetailSttpController extends GetxController {
  final box = GetStorage();
  final id = Get.arguments['id'];
  final TextEditingController kuantitasController = TextEditingController();
  Rx<InformasiDetailSTTP> informasiDetailSTTP = InformasiDetailSTTP().obs;
  RxBool isLoading = true.obs;
  RxString error = "".obs;
  RxBool isLoadingButton = false.obs;
  final Rx<File> image = File('').obs;
  RxString scanResult = "".obs;

  //Dropdown Gudang/Loc
  Rx<Loc> dataLoc = Loc().obs;
  RxBool isLoadingLoc = true.obs;
  RxString loc = "".obs;
  final TextEditingController locController = TextEditingController();

  //Dropdown Type
  Rx<GudangType> dataType = GudangType().obs;
  RxBool isLoadingType = true.obs;
  RxString type = "".obs;
  final TextEditingController typeController = TextEditingController();

  //Dropdown bin/layout/rak
  Rx<Bin> dataBin = Bin().obs;
  RxString bin = "".obs;
  RxBool isLoadingBin = true.obs;
  final TextEditingController binController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    fetchInfoSTTP();
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

  void fetchInfoSTTP() async {
    error.value = '';
    isLoading.value = true;

    try {
      Response response =
          await STTPService().fetchInfoSTTP(box.read('token'), id.toString());
      print(response.toString());
      if (response.statusCode == 200) {
        informasiDetailSTTP.value = InformasiDetailSTTP.fromJson(response.data);
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

  void getTypeGudang(gudang) async {
    isLoadingType.value = true;
    typeController.clear();
    type.value = "";
    loc.value = gudang;
    try {
      Response response = await GudangService().getType(
          token: box.read('token'), queryparams: {"location_id": gudang});
      if (response.statusCode == 200) {
        GudangType dataTypeGudang = GudangType.fromJson(response.data);
        dataType.value = dataTypeGudang;
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
      isLoadingType.value = false;
    }
  }

  void getBinGudang(type) async {
    isLoadingBin.value = true;
    binController.clear();
    bin.value = "";
    this.type.value = type;
    // print(this.type.value);
    try {
      Response response = await GudangService().getBin(
          token: box.read('token'),
          queryparams: {"location_id": loc.value, "type_id": type});
      if (response.statusCode == 200) {
        Bin resBin = Bin.fromJson(response.data);
        dataBin.value = resBin;
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
      isLoadingBin.value = false;
    }
  }

  void postData() async {
    // print(loc.value);
    // print(type.value);

    isLoadingButton.value = true;
    print("value :" + bin.value);
    if ((bin.value.isEmpty || kuantitasController.text == "") &&
        scanResult.value.isEmpty) {
      CustomSnackbar.snackbarFailed(
          title: "Error", message: "Data must not empty");
      isLoadingButton.value = false;
    } else if (int.tryParse(kuantitasController.text.toString())! >
        (informasiDetailSTTP.value.data?.qtyLeft)!) {
      CustomSnackbar.snackbarFailed(
          title: "Error",
          message: "Quantity must not greater than Quantity left");
      isLoadingButton.value = false;
    } else {
      try {
        Response response;

        if (image.value.path.isNotEmpty) {
          response = await STTPService().postInfo(
              token: box.read('token'),
              body: FormData.fromMap({
                "id": id,
                "material_code": informasiDetailSTTP.value.data?.materialCode,
                "bin_code":
                    scanResult.value.isEmpty ? bin.value : scanResult.value,
                "qty_in": kuantitasController.text,
                "foto": await MultipartFile.fromFile(image.value.path,
                    filename: image.value.path.split('/').last),
              }));
        } else {
          response = await STTPService().postInfo(
              token: box.read('token'),
              body: FormData.fromMap({
                "id": id,
                "material_code": informasiDetailSTTP.value.data?.materialCode,
                "bin_code":
                    scanResult.value.isEmpty ? bin.value : scanResult.value,
                "qty_in": kuantitasController.text,
              }));
        }
        // print(response.statusCode);
        if (response.statusCode == 200) {
          Get.arguments['refresh']();
          Get.back();
          CustomSnackbar.snackbarSuccess(
              title: "Success", message: "Data berhasil ditambahkan");
        } else {
          error.value = response.statusMessage.toString();
          CustomSnackbar.snackbarFailed(
              title: "Error", message: error.value.toString());
          Get.back();
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 404) {
          CustomSnackbar.snackbarFailed(
              title: "Error: ", message: "Data Not Found");
          error.value = "Data not found";
        } else if (e.response?.statusCode == 401) {
          Get.offAndToNamed('/login');

          CustomSnackbar.snackbarFailed(
              title: "Login Status: ", message: "Login Expired");
        } else if (e.response?.statusCode == 422) {
          CustomSnackbar.snackbarFailed(
              title: "Post Status: ", message: e.response?.data['message']);
        } else {
          CustomSnackbar.snackbarFailed(
              title: "Error",
              message: "Something went wrong  ${e.response?.statusCode}");
        }
      } finally {
        isLoadingButton.value = false;
      }
      // print(bin.value);
      // print(kuantitasController.text);
    }
  }

  pickImageC() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;

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

      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
