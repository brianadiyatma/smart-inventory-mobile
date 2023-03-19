import 'package:get/get.dart';

class BottomNavigatorController extends GetxController {
  //TODO: Implement BottomNavigatorController

  Rx<int> tabIndex = 0.obs;

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

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
