import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inka_smart_inventory_mobile/app/data/refresh_token.dart';
import 'package:inka_smart_inventory_mobile/app/utils/dio_utils.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';

import '../../../routes/app_pages.dart';
import 'package:get/get.dart' hide Response;
import '../../../services/auth_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  final box = GetStorage();
  final count = 0.obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;
  TextEditingController ipController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    refreshToken();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void refreshToken() async {
    isLoading.value = true;
    String token = box.read('token') == null ? "" : box.read('token');

    try {
      Response response = await AuthService().refreshToken(token);
      Refresh mappedRefresh = Refresh.fromJson(response.data);
      box.write('token', mappedRefresh.token);
      CustomSnackbar.snackbarBlue(
          title: "Welcome Back", message: "Welcome Back [Session is Valid]");
      Get.offAndToNamed('/bottom-navigator');
      isLoading.value = false;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        box.remove('token');
        Get.offAndToNamed('/login');
        CustomSnackbar.snackbarFailed(
            title: "Session is Not Valid",
            message: "Session is Not Valid, Please Login Again");
      } else {
        errorMessage.value = e.error.toString();
        Get.defaultDialog(
          title: "Error",
          content: Text(
            errorMessage.value.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          confirm: ElevatedButton(
              onPressed: (() {
                Get.back(closeOverlays: true);
                refreshToken();
              }),
              child: const Text(
                "Retry",
                style: TextStyle(color: Colors.white),
              )),
          actions: [
            ElevatedButton(
                onPressed: (() {
                  box.remove('ip');
                  Get.defaultDialog(
                    title: "Insert Your IP here",
                    content: TextField(
                      controller: ipController,
                      decoration: const InputDecoration(
                        hintText: "IP Address",
                      ),
                    ),
                    confirm: ElevatedButton(
                        onPressed: (() {
                          DioClient.baseUrl = ipController.text;
                          box.write('ip', ipController.text);
                          Get.back(closeOverlays: true);
                          refreshToken();
                        }),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        )),
                  );
                }),
                child: const Text(
                  "Change Address",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
        // Get.offAndToNamed('/login');
      }
    }
    isLoading.value = false;
  }

  void increment() => count.value++;
}
