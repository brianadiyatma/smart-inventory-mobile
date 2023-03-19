import 'package:get/get.dart';

import '../controllers/qr_helper_controller.dart';

class QrHelperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrHelperController>(
      () => QrHelperController(),
    );
  }
}
