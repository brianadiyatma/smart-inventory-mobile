import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/materials_service.dart';
import '../../../../data/data_materials_list.dart';

class MaterialController extends GetxController {
  //TODO: Implement MaterialController

  var box = GetStorage();
  Rx<Materials> storageData = Materials().obs;
  final error = ''.obs;
  RxBool isLoading = true.obs;

  //Search
  final searchController = TextEditingController();

  //pagination
  int lastPage = 0;
  int page = 1;
  RxList materialList = <MaterialContent>[].obs;
  RxBool isLastPage = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    getMaterialList();

    scrollController.addListener(() {
      print("listener init");
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMaterialListScroll();
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

  void getMaterialList() async {
    isLoading.value = true;
    error.value = '';

    isLastPage.value = false;
    try {
      Response response = await MaterialService().getMaterial(
          token: box.read('token'),
          queryparams: {'query': searchController.text, 'page': page});
      if (response.statusCode == 200) {
        Materials data = Materials.fromJson(response.data['data']);
        storageData.value = data;
        lastPage = storageData.value.lastPage!;
        // storageList.value += storageData.value.data!;

        materialList.value = storageData.value.content!;
        if (lastPage == page) {
          isLastPage.value = true;
        } else {
          page++;
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
          message: "Something went wrong [${e.message}]",
        );
        error.value = "Something went wrong [${e.message}]";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void getMaterialListScroll() async {
    try {
      if (page != lastPage) {
        Response response = await MaterialService().getMaterial(
            token: box.read('token'),
            queryparams: {"page": page, "query": searchController.text});
        if (response.statusCode == 200) {
          Materials data = Materials.fromJson(response.data['data']);
          storageData.value = data;
          lastPage = storageData.value.lastPage!;
          // storageList.value += storageData.value.data!;

          materialList.value += storageData.value.content!;
          page++;
          print(page);
          print("page $page " + "last page $lastPage");
          if (lastPage == page) {
            isLastPage.value = true;
          }
        } else {
          throw "Failed to Load Data";
        }
      } else {
        isLastPage.value = true;
      }
    } on DioError catch (e) {
      print(e);
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
          message: "Something went wrong [${e.message}]",
        );
        error.value = "Something went wrong [${e.message}]";
      }
    } finally {
      isLoading.value = false;
    }
  }
}
