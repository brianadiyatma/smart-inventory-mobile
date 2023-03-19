import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_history_material.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_material_information.dart';

import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../../services/materials_service.dart';
import 'package:dio/dio.dart';
import '../../../../data/data_material_loc.dart';

class DetailMaterialController extends GetxController {
  //TODO: Implement DetailMaterialController

  final Map args = Get.arguments;

  var box = GetStorage();

  //Loc
  final errorLoc = ''.obs;
  RxBool isLoadingLoc = true.obs;
  Rx<MaterialLoc> storageData = MaterialLoc().obs;
  RxList<Content> storageDataContent = <Content>[].obs;
  int pageLoc = 1;
  int lastPageLoc = 0;
  RxBool isLastPageLoc = false.obs;
  final ScrollController scrollLocController = ScrollController();

  //history
  final errorHis = ''.obs;
  RxBool isLoadingHis = true.obs;
  Rx<HistoryMaterial> historyData = HistoryMaterial().obs;
  RxList<HistoryContent> historyDataContent = <HistoryContent>[].obs;
  int pageHistory = 1;
  int lastPageHistory = 0;
  RxBool isLastPageHistory = false.obs;
  final ScrollController scrollHistoryController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getMaterialLoc();
    getMaterialHistory();
    scrollLocController.addListener(() {
      print("listener init");
      if (scrollLocController.position.pixels ==
          scrollLocController.position.maxScrollExtent) {
        getMaterialLocoOScroll();
      }
    });
    scrollHistoryController.addListener(() {
      print("listener init");
      if (scrollHistoryController.position.pixels ==
          scrollHistoryController.position.maxScrollExtent) {
        getMaterialHistoryOnScroll();
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

  void getMaterialLoc() async {
    isLoadingLoc.value = true;
    errorLoc.value = '';
    try {
      Response response = await MaterialService().getMaterialLocation(
          token: box.read('token'),
          queryParams: {
            'material_code': args['materialCode'],
            'wbs_element': args['specialStock']
          });
      if (response.statusCode == 200) {
        storageData.value = MaterialLoc.fromJson(response.data["data"]);
        storageDataContent.value = storageData.value.content!;
        lastPageLoc = storageData.value.lastPage!;
        if (lastPageLoc == pageLoc) {
          isLastPageLoc.value = true;
        }
      } else {
        isLoadingLoc.value = false;
        errorLoc.value = response.data['message'];
        CustomSnackbar.snackbarFailed(title: "ERROR", message: errorLoc.value);
      }
    } on DioError catch (e) {
      errorLoc.value = e.response!.data['message'];
      CustomSnackbar.snackbarFailed(title: "ERROR", message: errorLoc.value);
    } finally {
      isLoadingLoc.value = false;
    }
  }

  void getMaterialLocoOScroll() async {
    errorLoc.value = '';
    try {
      if (pageLoc != lastPageLoc) {
        Response response = await MaterialService()
            .getMaterialLocation(token: box.read('token'), queryParams: {
          'material_code': args['materialCode'],
          'wbs_element': args['specialStock'],
          'page': pageLoc
        });
        if (response.statusCode == 200) {
          print("success");
          storageData.value = MaterialLoc.fromJson(response.data["data"]);
          storageDataContent.value += storageData.value.content!;

          pageLoc++;
          if (pageLoc == lastPageLoc) {
            isLastPageLoc.value = true;
          }
        } else {
          isLoadingLoc.value = false;
          errorLoc.value = response.data['message'];
          CustomSnackbar.snackbarFailed(
              title: "ERROR", message: errorLoc.value);
        }
      } else {
        isLastPageLoc.value = true;
      }
    } on DioError catch (e) {
      errorLoc.value = e.response!.data['message'];
      CustomSnackbar.snackbarFailed(title: "ERROR", message: errorLoc.value);
    } finally {
      isLoadingLoc.value = false;
    }
  }

  void getMaterialHistory() async {
    isLoadingHis.value = true;
    errorHis.value = '';
    try {
      Response response = await MaterialService().getMaterialHistory(
          token: box.read('token'),
          queryParams: {
            'material_code': args['materialCode'],
            'wbs_element': args['specialStock']
          });
      print(response.data);
      if (response.statusCode == 200) {
        historyData.value = HistoryMaterial.fromJson(response.data["data"]);
        historyDataContent.value = historyData.value.historyContent!;

        lastPageHistory = historyData.value.lastPage!;
        if (lastPageHistory == pageHistory) {
          isLastPageHistory.value = true;
        }
      } else {
        isLastPageHistory.value = false;
        errorHis.value = response.data['message'];
        CustomSnackbar.snackbarFailed(title: "ERROR", message: errorHis.value);
      }
    } on DioError catch (e) {
      errorHis.value = e.response!.data['message'];
      CustomSnackbar.snackbarFailed(title: "ERROR", message: errorHis.value);
    } finally {
      isLoadingHis.value = false;
    }
  }

  void getMaterialHistoryOnScroll() async {
    errorHis.value = '';

    try {
      if (pageHistory != lastPageHistory) {
        Response response = await MaterialService().getMaterialHistory(
            token: box.read('token'),
            queryParams: {
              'material_code': args['materialCode'],
              'wbs_element': args['specialStock']
            });
        print(response.data);
        if (response.statusCode == 200) {
          historyData.value = HistoryMaterial.fromJson(response.data["data"]);
          historyDataContent.value += historyData.value.historyContent!;
          pageHistory++;
          lastPageHistory = historyData.value.lastPage!;
          if (lastPageHistory == pageHistory) {
            isLastPageHistory.value = true;
          }
        } else {
          isLastPageHistory.value = false;
          errorHis.value = response.data['message'];
          CustomSnackbar.snackbarFailed(
              title: "ERROR", message: errorHis.value);
        }
      } else {
        isLastPageHistory.value = true;
      }
    } on DioError catch (e) {
      errorHis.value = e.response!.data['message'];
      CustomSnackbar.snackbarFailed(title: "ERROR", message: errorHis.value);
    } finally {
      isLoadingHis.value = false;
    }
  }
}
