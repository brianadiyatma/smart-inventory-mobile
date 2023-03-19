import 'package:get/get.dart';

import '../controllers/informasi_detail_bpm_controller.dart';

class InformasiDetailBpmBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InformasiDetailBpmController>(InformasiDetailBpmController());
  }
}
