import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/services/auth_service.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';

import '../../../services/dashboard_provider.dart';
import '../../../data/dashboardv2.dart';

class Dashboardv2Controller extends GetxController {
  final box = GetStorage();

  Rx<String> selectedPeriod = "This Week".obs;
  Rx<DashboardV2> dashboardData = DashboardV2().obs;

  RxBool isLoading = true.obs;
  RxString error = ''.obs;
  RxString profilePic = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getDashboardInformationFun();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDashboardInformationFun() async {
    String token = box.read('token');
    isLoading.value = true;
    error.value = "";
    try {
      Response response = await DashboardProvider().getDashboardInformation(
          token: token, query: {'query': selectedPeriod.value});
      DashboardV2 dataDashboard = DashboardV2.fromJson(response.data);
      dashboardData.value = dataDashboard;
      getPhoto();
      error.value = "";
    } on DioError catch (e) {
      print(e.message);
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Login Status: ", message: "Unauthorize");
        Get.offAndToNamed('/login');
      } else {
        error.value = "Something went wrong";
        CustomSnackbar.snackbarFailed(
            title: "Error", message: "Something went wrong");
      }
    } finally {
      isLoading.value = false;
    }
  }

  void getPhoto() async {
    String token = box.read('token');
    try {
      Response response = await AuthService().getPhoto(token);

      profilePic.value = response.data['image'];
      print('success get photo');

      update();
    } on DioError catch (e) {
      CustomSnackbar.snackbarFailed(
          title: "Image Failed", message: "Image can't be loaded");
    }
  }
}
