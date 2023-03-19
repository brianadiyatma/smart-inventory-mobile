import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';
import '../../../utils/assets_util.dart';

class SplashScreenView extends GetView<SplashscreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AssetsUtil.imageLogoAppBorder,
                height: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
