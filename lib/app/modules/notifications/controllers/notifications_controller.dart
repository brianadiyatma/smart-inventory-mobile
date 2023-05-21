import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../services/notifications.dart';
import '../../../data/notifications.dart';
import 'package:flutter/material.dart' hide Notification;

class NotificationsController extends GetxController {
  //TODO: Implement NotificationsController

  final isLoading = true.obs;
  final Rx<Notifications> notificationsData = Notifications().obs;
  final error = ''.obs;
  var box = GetStorage();
  final scrollController = ScrollController();
  int page = 1;

  RxBool isLastPage = false.obs;
  int lastPage = 0;

  RxList notificationsList = <Notification>[].obs;

  void fetchNotification() async {
    isLoading.value = true;
    error.value = '';
    String token = box.read('token');
    try {
      Response response = await NotificationsService()
          .getNotif(token: token, params: {"page": page});
      Notifications notifications =
          Notifications.fromJson(response.data['data']);
      lastPage = notifications.lastPage!;
      this.notificationsData.value = notifications;
      notificationsList.value += notificationsData.value.data!;
      isLoading.value = false;
      if (page == lastPage) {
        isLastPage.value = true;
      }

      // print(notificationsData.value);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message:
              "Token anda sudah tidak valid [${e.response?.data['message']}]",
        );
        error.value = e.response?.data['message'];
        box.remove('token');
        Get.offAndToNamed('/login');
      } else {
        CustomSnackbar.snackbarFailed(
          title: "Kesalahan Jaringan",
          message: "Kesalahan Jaringan Periksa Kembali Koneksi Anda",
        );
        error.value = "Kesalahan Jaringan Periksa Kembali Koneksi Anda";
      }

      isLoading.value = false;
    }
  }

  fetchNotificationOnScroll() async {
    error.value = '';
    String token = box.read('token');
    try {
      if (page != lastPage + 1) {
        print(page);
        print(lastPage);
        Response response = await NotificationsService()
            .getNotif(token: token, params: {"page": page});
        Notifications notifications =
            Notifications.fromJson(response.data['data']);
        this.notificationsData.value = notifications;
        notificationsList.value += notificationsData.value.data!;
        page++;
      } else {
        isLastPage.value = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message:
              "Token anda sudah tidak valid [${e.response?.data['message']}]",
        );
        error.value = e.response?.data['message'];
        box.remove('token');
        Get.offAndToNamed('/login');
      } else {
        CustomSnackbar.snackbarFailed(
          title: "Kesalahan Jaringan",
          message: "Kesalahan Jaringan Periksa Kembali Koneksi Anda",
        );
        error.value = "Kesalahan Jaringan Periksa Kembali Koneksi Anda";
      }

      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    fetchNotification();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchNotificationOnScroll();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
