import 'package:get/get.dart';

import '../controllers/dashboardv2_controller.dart';

class Dashboardv2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dashboardv2Controller>(
      () => Dashboardv2Controller(),
    );
  }
}
