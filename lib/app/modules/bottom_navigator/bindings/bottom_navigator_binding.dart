import 'package:get/get.dart';

import '../controllers/bottom_navigator_controller.dart';

class BottomNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigatorController>(
      () => BottomNavigatorController(),
    );
  }
}
