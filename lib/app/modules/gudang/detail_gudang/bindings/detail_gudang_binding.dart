import 'package:get/get.dart';

import '../controllers/detail_gudang_controller.dart';

class DetailGudangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGudangController>(
      () => DetailGudangController(),
    );
  }
}
