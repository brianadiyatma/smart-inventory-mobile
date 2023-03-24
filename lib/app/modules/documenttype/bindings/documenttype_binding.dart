import 'package:get/get.dart';

import '../controllers/documenttype_controller.dart';

class DocumenttypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumenttypeController>(
      () => DocumenttypeController(),
    );
  }
}
