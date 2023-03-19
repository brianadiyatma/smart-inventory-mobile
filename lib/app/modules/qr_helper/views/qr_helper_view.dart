import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/qrcode/widgets/qr_scan_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/qr_helper_controller.dart';

class QrHelperView extends GetView<QrHelperController> {
  const QrHelperView({Key? key}) : super(key: key);

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
