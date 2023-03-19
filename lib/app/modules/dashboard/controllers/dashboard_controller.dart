import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_material_information.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_transaction_not.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_header_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_transaction_section.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bottom_navigator/controllers/bottom_navigator_controller.dart';
import 'package:inka_smart_inventory_mobile/app/services/dashboard_provider.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';

class DashboardController extends GetxController {
  var box = GetStorage();
  // Rx<DataHeaderDashboard> dataHeaderDashboard = DataHeaderDashboard().obs;
  // Rx<DataTransactionSection> dataTransactionSection =
  //     DataTransactionSection().obs;
  // Rx<DataMaterialInformation> dataMaterialInformation =
  //     DataMaterialInformation().obs;
  // Rx<DataTransactionNotProcess> dataTransactionNotProcess =
  //     DataTransactionNotProcess().obs;
  Rx<DataDashboard> dashboardData = DataDashboard().obs;
  Rx<String> selectedPeriod = "".obs;

  Rx<String> error = "".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedPeriod.value = "This Week";
    getDashboardInformationFun();
    // getHeaderDashboard();
    // getTransactionSection();
    // getTransactionNotProcess();
    // getMaterialInformation();
  }

  void viewMore(int index) {
    BottomNavigatorController().changeTabIndex(index);
  }

  // void getHeaderDashboard({String? query}) async {
  //   String token = box.read('token');
  //   try {
  //     Response response = await DashboardProvider()
  //         .getHeader(token: token, query: selectedPeriod.value.toString());
  //     DataHeaderDashboard data = DataHeaderDashboard.fromJson(response.data);
  //     dataHeaderDashboard.value = data;
  //     errorHeader.value = "";
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       CustomSnackbar.snackbarFailed(
  //           title: "Login Status: ",
  //           message: "Login token anda sudah tidak valid silahkan login ulang");
  //       Get.offAndToNamed('/login');
  //     } else {
  //       errorHeader.value = e.error;
  //       print(e.error.toString());
  //     }
  //   }
  // }

  // void getTransactionSection() async {
  //   String token = box.read('token');
  //   try {
  //     Response response =
  //         await DashboardProvider().getTransactionSection(token);
  //     DataTransactionSection data =
  //         DataTransactionSection.fromJson(response.data);
  //     dataTransactionSection.value = data;
  //     errorTransaction.value = "";
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       CustomSnackbar.snackbarFailed(
  //           title: "Login Status: ",
  //           message: "Login token anda sudah tidak valid silahkan login ulang");
  //       box.remove('token');
  //       Get.offAndToNamed('/login');
  //     } else {
  //       errorTransaction.value = e.error.toString();
  //       print(e.error.toString());
  //     }
  //   }
  // }

  // void getTransactionNotProcess() async {
  //   String token = box.read('token');
  //   try {
  //     Response response =
  //         await DashboardProvider().getTransactionSectionNotProcess(token);
  //     DataTransactionNotProcess data =
  //         DataTransactionNotProcess.fromJson(response.data);
  //     dataTransactionNotProcess.value = data;
  //     errorTransactionNot.value = "";
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       CustomSnackbar.snackbarFailed(
  //           title: "Login Status: ",
  //           message: "Login token anda sudah tidak valid silahkan login ulang");
  //       Get.offAndToNamed('/login');
  //     } else {
  //       errorTransactionNot.value = e.error;
  //       print(e.error.toString());
  //     }
  //   }
  // }

  // void getMaterialInformation() async {
  //   String token = box.read('token');
  //   try {
  //     Response response =
  //         await DashboardProvider().getMaterialInformation(token);
  //     DataMaterialInformation data =
  //         DataMaterialInformation.fromJson(response.data);
  //     dataMaterialInformation.value = data;
  //     errorMaterial.value = "";
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       CustomSnackbar.snackbarFailed(
  //           title: "Login Status: ",
  //           message: "Login token anda sudah tidak valid silahkan login ulang");
  //       Get.offAndToNamed('/login');
  //     } else {
  //       errorMaterial.value = e.error;
  //       print(e.error.toString());
  //     }
  //   }
  // }

  void getDashboardInformationFun() async {
    String token = box.read('token');
    isLoading.value = true;
    error.value = "";
    try {
      Response response = await DashboardProvider().getDashboardInformation(
          token: token, query: {'query': selectedPeriod.value});
      DataDashboard dataDashboard = DataDashboard.fromJson(response.data);
      dashboardData.value = dataDashboard;
      error.value = "";
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ", message: "Unauthorized");
        Get.offAndToNamed('/login');
      } else {
        error.value = e.error.toString();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
