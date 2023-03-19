import 'package:get/get.dart';

import '../controllers/detail_transaksi_bpm_controller.dart';

class DetailTransaksiBpmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransaksiBpmController>(
      () => DetailTransaksiBpmController(),
    );
  }
}
