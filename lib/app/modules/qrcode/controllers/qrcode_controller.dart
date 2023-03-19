import 'package:get/get.dart';

class QrcodeController extends GetxController {
  //TODO: Implement QrcodeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onScan(String qr) {
    try {
      List<String> scannedCode = qr.split('/');
      if (scannedCode.length == 3 &&
          (scannedCode[0] == "STTP" || scannedCode[0] == 'BPM')) {
        if (scannedCode[0] == 'BPM') {
          Get.toNamed('/detail-transaksi-bpm', arguments: {'docNum': qr});
        } else if (scannedCode[0] == 'STTP') {
          Get.toNamed('/detail-transaksi-sttp', arguments: {'docNum': qr});
        } else {
          Get.snackbar('Error', 'QR Code tidak valid');
        }
      } else {
        Get.snackbar('Error', 'QR Code tidak valid');
      }
    } catch (e) {
      Get.snackbar('Error', 'QR Code tidak valid');
    }
  }

  void increment() => count.value++;
}
