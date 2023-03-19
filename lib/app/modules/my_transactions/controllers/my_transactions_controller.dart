import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_transaction_list.dart';
import 'package:inka_smart_inventory_mobile/app/services/transaction_service.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';

class MyTransactionsController extends GetxController {
  var box = GetStorage();
  Rx<DataTransactionList> dataTransactionList = DataTransactionList().obs;
  RxInt pageNumber = 1.obs;
  RxInt lastPage = 1.obs;
  final ScrollController scrollController = ScrollController();
  RxList<Dokumen> listDokumen = [Dokumen()].obs;
  Rx<String> errorTransactionList = "".obs;
  RxBool isLoading = false.obs;
  Rx<String> queryString = "".obs;
  final TextEditingController searchController = TextEditingController();

  var typeTransaction = Get.arguments;
  final statusDoc = <Map>[
    {"title": "Unprocessed", "isCheck": false},
    {"title": "On Process", "isCheck": false},
    {"title": "Processed", "isCheck": false}
  ].obs;

  final typeDoc = <Map>[
    {"title": "STTP", "isCheck": false},
    {"title": "BPM", "isCheck": false},
    {"title": "BPRM", "isCheck": false}
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
      print('dada');
      statusChange(true, 0);
      selectedStatus.value = List.from(statusDoc
          .where((element) => element['isCheck'] == true)
          .map((e) => e['title']));
      searchTransaction(query: '');
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

  void getTransactionList({String? query}) async {
    String token = box.read('token');
    errorTransactionList.value = "";
    isLoading.value = true;
    try {
      Response response;
      if (typeTransaction == null) {
        response = await TransactionService()
            .getMyTransaction(token: token, query: {"query": ''});
      } else {
        response = await TransactionService()
            .getTransactionList(token: token, query: {"query": ''});
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
        print(e.error.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }

  void searchTransaction({required String query}) async {
    String token = box.read('token');
    errorTransactionList.value = "";
    isLoading.value = true;
    queryString.value = query;
    if (queryString.isEmpty && selectedStatus.isEmpty) {
      getTransactionList();
    } else {
      try {
        Response response;
        if (typeTransaction == null) {
          response = await TransactionService()
              .getMyTransaction(token: token, query: {'query': query.trim()});
        } else {
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
              'status':
                  selectedStatus.isNotEmpty ? selectedStatus.join(',') : '',
              'type': selectedType.isNotEmpty ? selectedType.join(',') : ''
            });
          }
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
          print(e.error.toString());
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
        if (typeTransaction == null) {
          response = await TransactionService().getMyTransaction(
              token: token,
              query: {'page': pageNumber, 'query': queryString.value.trim()});
        } else {
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
              'status':
                  selectedStatus.isNotEmpty ? selectedStatus.join(',') : '',
              'type': selectedType.isNotEmpty ? selectedType.join(',') : ''
            });
          }
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
        print(e.error.toString());
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
    statusDoc[index]["isCheck"] = value;
    update();
  }
}
