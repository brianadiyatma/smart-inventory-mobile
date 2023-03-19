import 'package:get/get.dart';

import '../controllers/informasi_detail_sttp_controller.dart';

class InformasiDetailSttpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InformasiDetailSttpController>(InformasiDetailSttpController());
  }
}
