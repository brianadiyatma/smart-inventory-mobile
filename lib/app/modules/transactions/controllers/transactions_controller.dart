import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_transaction_list.dart';
import 'package:inka_smart_inventory_mobile/app/services/transaction_service.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';

class TransactionsController extends GetxController {
  var box = GetStorage();
  Rx<DataTransactionList> dataTransactionList = DataTransactionList().obs;
  RxInt pageNumber = 1.obs;
  RxInt lastPage = 1.obs;
  final ScrollController scrollController = ScrollController();
  RxList<Dokumen> listDokumen = [Dokumen()].obs;
  Rx<String> errorTransactionList = "".obs;
  RxBool isPage = false.obs;
  Rx<String> queryString = "".obs;
  RxBool isLoading = false.obs;

  final TextEditingController searchController = TextEditingController();

  final statusDoc = <Map>[
    {"title": "UNPROCESSED", "isCheck": false},
    {"title": "ON PROCESS", "isCheck": false},
    {"title": "PROCESSED", "isCheck": false}
  ].obs;

  final typeDoc = <Map>[
    {"title": "STTP", "isCheck": false},
    {"title": "BPM", "isCheck": false}
  ].obs;

  RxList selectedStatus = [].obs;
  RxList selectedType = [].obs;

  RxBool isloadMore = false.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == null) {
      getTransactionList();
    } else {
      if (Get.arguments['page'] != null) {
        isPage.value = Get.arguments['page'];
      }
      if (Get.arguments['status'] != null) {
        statusChange(true, 0);
        selectedStatus.value = List.from(statusDoc
            .where((element) => element['isCheck'] == true)
            .map((e) => e['title']));
        print(selectedStatus);
        searchTransaction(query: '');
      }
    }

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPaginationItem();
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

  void clear() {
    queryString.value = '';
    selectedStatus.value = [];
    selectedType.value = [];
    for (var i = 0; i < 3; i++) {
      statusDoc[i]['isCheck'] = false;
    }
    for (var i = 0; i < 2; i++) {
      typeDoc[i]['isCheck'] = false;
    }
  }

  void getTransactionList({String? query}) async {
    clear();
    String token = box.read('token');
    errorTransactionList.value = "";
    isLoading.value = true;
    try {
      Response response = await TransactionService()
          .getTransactionList(token: token, query: {"query": ''});
      DataTransactionList data = DataTransactionList.fromJson(response.data);
      dataTransactionList.value = data;
      print(data.toString());
      listDokumen.value = data.data!.data;
      errorTransactionList.value = "";
      pageNumber.value = dataTransactionList.value.data!.currentPage!;
      lastPage.value = dataTransactionList.value.data!.lastPage!;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ",
            message: "Your login token is invalid, please login again");
        Get.offAndToNamed('/login');
      } else {
        errorTransactionList.value = e.error.toString();
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void searchTransaction({
    required String query,
  }) async {
    String token = box.read('token');
    queryString.value = query.trim();
    errorTransactionList.value = "";
    isLoading.value = true;
    if (query.isEmpty && selectedStatus.isEmpty) {
      getTransactionList();
    } else {
      try {
        Response response;
        if (queryString.isEmpty &&
            selectedType.isEmpty &&
            selectedStatus.isEmpty) {
          response = await TransactionService().getTransactionList(
              token: token, query: {'page': pageNumber.value});
        } else {
          response = await TransactionService()
              .getTransactionList(token: token, query: {
            'page': pageNumber.value,
            'query': queryString.value.isNotEmpty ? queryString.value : '',
            'status': selectedStatus.isNotEmpty ? selectedStatus.join(',') : '',
            'type': selectedType.isNotEmpty ? selectedType.join(',') : ''
          });
        }
        DataTransactionList data = DataTransactionList.fromJson(response.data);
        dataTransactionList.value = data;
        listDokumen.value = data.data!.data;
        errorTransactionList.value = "";
        pageNumber.value = dataTransactionList.value.data!.currentPage!;
        lastPage.value = dataTransactionList.value.data!.lastPage!;
      } on DioError catch (e) {
        if (e.response?.statusCode == 401) {
          CustomSnackbar.snackbarFailed(
              title: "Login Status: ",
              message: "Your login token is invalid, please login again");
          Get.offAndToNamed('/login');
        } else {
          errorTransactionList.value = e.error.toString();
        }
      } finally {
        isLoading.value = false;
      }
    }
  }

  void getPaginationItem() async {
    isloadMore.value = true;
    String token = box.read('token');
    errorTransactionList.value = "";
    try {
      if (pageNumber.value != lastPage.value) {
        pageNumber.value++;
        Response response;
        if (queryString.isEmpty &&
            selectedType.isEmpty &&
            selectedStatus.isEmpty) {
          response = await TransactionService().getTransactionList(
              token: token, query: {'page': pageNumber.value});
        } else {
          response = await TransactionService()
              .getTransactionList(token: token, query: {
            'page': pageNumber.value,
            'query': queryString.value.isNotEmpty ? queryString.value : '',
            'status': selectedStatus.isNotEmpty ? selectedStatus.join(',') : '',
            'type': selectedType.isNotEmpty ? selectedType.join(',') : ''
          });
        }
        DataTransactionList data = DataTransactionList.fromJson(response.data);
        dataTransactionList.value = data;
        listDokumen.value += data.data!.data;
      } else {
        // CustomSnackbar.snackbarBlue(
        //     title: "Last Data", message: "Last Page Number");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ",
            message: "Your login token is invalid, please login again");
        Get.offAndToNamed('/login');
      } else {
        errorTransactionList.value = e.error;
      }
    } finally {
      isLoading.value = false;
      isloadMore.value = false;
    }
  }

  void statusChange(bool value, int index) {
    statusDoc[index]["isCheck"] = value;
    update();
  }

  void typeChange(bool value, int index) {
    typeDoc[index]["isCheck"] = value;
    update();
  }

  void confirmFilter({bool? page = false}) async {
    selectedStatus.value = [];
    selectedType.value = [];
    isLoading.value = true;
    selectedStatus.value = List.from(statusDoc
        .where((element) => element['isCheck'] == true)
        .map((e) => e['title']));

    selectedType.value = List.from(typeDoc
        .where((element) => element['isCheck'] == true)
        .map((e) => e['title']));
    String token = box.read('token');
    errorTransactionList.value = "";
    try {
      Response response;
      if (queryString.isEmpty &&
          selectedType.isEmpty &&
          selectedStatus.isEmpty) {
        response = await TransactionService().getTransactionList(
            token: token, query: {'page': pageNumber.value});
      } else {
        response =
            await TransactionService().getTransactionList(token: token, query: {
          'page': pageNumber.value,
          'query': queryString.value.isNotEmpty ? queryString.value : '',
          'status': selectedStatus.isNotEmpty ? selectedStatus.join(',') : '',
          'type': selectedType.isNotEmpty ? selectedType.join(',') : ''
        });
      }
      DataTransactionList data = DataTransactionList.fromJson(response.data);
      dataTransactionList.value = data;
      listDokumen.value = data.data!.data;
      errorTransactionList.value = "";
      pageNumber.value = dataTransactionList.value.data!.currentPage!;
      lastPage.value = dataTransactionList.value.data!.lastPage!;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ",
            message: "Your login token is invalid, please login again");
        Get.offAndToNamed('/login');
      } else {
        errorTransactionList.value = e.error.toString();
      }
    } finally {
      Get.back();
      isLoading.value = false;
    }
  }
}
