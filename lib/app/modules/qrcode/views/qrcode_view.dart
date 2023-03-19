import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/qrcode_controller.dart';
import '../widgets/qr_scan_overlay.dart';

class QrcodeView extends StatelessWidget {
  QrcodeView({Key? key}) : super(key: key);
  final controller = Get.put(QrcodeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            MobileScanner(
              onDetect: (barcode, args) {
                controller.onScan(barcode.rawValue!);
              },
            ),
            QRScannerOverlay(overlayColour: Colors.blue.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }
}
