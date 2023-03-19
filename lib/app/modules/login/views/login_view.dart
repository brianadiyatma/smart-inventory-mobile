import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import './widgets/nip_form.dart';
import '../../../utils/assets_util.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                    child: Image.asset(
                  AssetsUtil.imageLogoAppBorder,
                  height: 70,
                )),
                Center(
                  child: Text(
                    "Smart Inventory".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "NIP",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                NipFieldLogin(controller: controller.nipController),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => Material(
                      elevation: 7,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: controller.passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: (() {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            }),
                            child: const Icon(
                              CupertinoIcons.eye,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          hintText: "Enter your Password",
                          hintStyle:
                              const TextStyle(height: 1, color: Colors.grey),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: SizedBox.shrink(),
                    ),
                    Expanded(
                        flex: 6,
                        child: Obx(() {
                          return ElevatedButton(
                              style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(12)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade900)),
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      // Get.toNamed('/bottom-navigator');
                                      controller.login(
                                          controller.nipController.text,
                                          controller.passwordController.text);
                                    },
                              child: controller.isLoading.value == true
                                  ? const SizedBox(
                                      height: 23,
                                      width: 23,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("LOGIN",
                                      style: TextStyle(fontSize: 16)));
                        })),
                    const Expanded(
                      flex: 3,
                      child: SizedBox.shrink(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/forgot-password');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      // },
    );
    // ),
    //   ),
    // );
  }
}
