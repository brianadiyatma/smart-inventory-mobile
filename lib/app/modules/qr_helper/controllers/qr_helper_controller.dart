import 'package:get/get.dart';

class QrHelperController extends GetxController {
  //TODO: Implement QrHelperController
  Function onScan = Get.arguments;

  final count = 0.obs;
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

  void onScanned(e) {
    onScan(e);
  }
}
