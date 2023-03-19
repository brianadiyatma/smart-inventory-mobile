import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/dio_utils.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: WebView(
          onProgress: (progress) {
            if (progress == 100) {
              controller.isLoading.value = false;
            } else {
              controller.isLoading.value = true;
            }
          },
          initialUrl: '${DioClient.baseUrl}/password/reset',
        ),
      ),
    );
  }
}
