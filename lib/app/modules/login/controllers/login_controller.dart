import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:inka_smart_inventory_mobile/app/data/auth.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../services/auth_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  //TODO: Widget Snackbar custom design
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  var isPasswordHidden = true.obs;
  final box = GetStorage();
  final count = 0.obs;
  final TextEditingController nipController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login(String email, String password) async {
    isLoading.value = true;
    String? token;
    try {
      Response loginResponse = await AuthService().login(email, password);
      Auth authMapped = Auth.fromJson(loginResponse.data);
      box.write('token', authMapped.token);
      isLoading.value = false;
      errorMessage.value = "";
      CustomSnackbar.snackbarSuccess(
          title: "Login Status",
          message: "Login Successfully Verified by Server");
      Get.offAndToNamed('/bottom-navigator');
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message: e.response?.data['message'],
        );
        errorMessage.value = e.response?.data['message'];
      } else {
        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message: e.error.toString(),
        );
        errorMessage.value = e.error.toString();
      }

      isLoading.value = false;
    }
  }

  void increment() {}
}
