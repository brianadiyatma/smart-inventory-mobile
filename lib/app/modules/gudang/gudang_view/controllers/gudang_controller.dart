import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/gudang_service.dart';
import '../../../../data/data_storage.dart';

class GudangController extends GetxController {
  var box = GetStorage();
  Rx<Storage> storageData = Storage().obs;
  final error = ''.obs;
  RxBool isLoading = false.obs;

  //Search
  final searchController = TextEditingController();

  //pagination
  int lastPage = 0;
  int page = 1;
  RxList storageList = <StorageContent>[].obs;
  RxBool isLastPage = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getWarehouseList();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getWarehouseListonScroll();
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
  }

  void getWarehouseList() async {
    isLoading.value = true;
    error.value = '';
    isLastPage.value = false;
    page = 1;
    try {
      Response response = await GudangService().getStorage(
          token: box.read('token'),
          queryparams: {'query': searchController.text});
      if (response.statusCode == 200) {
        Storage data = Storage.fromJson(response.data['data']);
        storageData.value = data;
        lastPage = storageData.value.lastPage!;
        // storageList.value += storageData.value.data!;

        storageList.value = storageData.value.data!;

        if (lastPage == page) {
          isLastPage.value = true;
        }
      } else {
        throw "Failed to Load Data";
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        error.value = e.response?.data['message'];
        box.remove('token');
        Get.offAndToNamed('/login');

        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message: "Token is Not Valid [${e.response?.data['message']}]",
        );
      } else {
        CustomSnackbar.snackbarFailed(
          title: "Error",
          message: "Something went wrong [${e.response?.statusCode}]",
        );
        error.value = "Something went wrong [${e.response?.statusCode}]";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void getWarehouseListonScroll() async {
    error.value = '';
    String token = box.read('token');
    try {
      if (page != lastPage) {
        Response response =
            await GudangService().getStorage(token: token, queryparams: {
          "page": page,
          'query': searchController.text,
        });
        Storage data = Storage.fromJson(response.data['data']);
        this.storageData.value = data;
        storageList.value += storageData.value.data!;
        page++;
        lastPage = storageData.value.lastPage!;
      } else {
        isLastPage.value = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
          title: "Login Status",
          message: "Token is not valid [${e.response?.data['message']}]",
        );
        error.value = e.response?.data['message'];
        box.remove('token');
        Get.offAndToNamed('/login');
      } else {
        CustomSnackbar.snackbarFailed(
          title: "Error",
          message: "Something went wrong [${e.response?.statusCode}]",
        );
        error.value = "Something went wrong [${e.response?.statusCode}]";
      }
    }
  }
}
