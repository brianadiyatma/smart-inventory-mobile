import 'package:get/get.dart';

import '../controllers/detail_transaksi_sttp_controller.dart';

class DetailTransaksiSttpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailTransaksiSttpController>(
      DetailTransaksiSttpController(),
    );
  }
}
