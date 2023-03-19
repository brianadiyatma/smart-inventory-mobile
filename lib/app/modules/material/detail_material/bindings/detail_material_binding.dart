import 'package:get/get.dart';

import '../controllers/detail_material_controller.dart';

class DetailMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMaterialController>(
      () => DetailMaterialController(),
    );
  }
}
