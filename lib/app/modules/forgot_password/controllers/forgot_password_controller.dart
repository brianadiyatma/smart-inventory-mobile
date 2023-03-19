import 'package:get/get.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController


  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isIOS) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
