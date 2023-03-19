import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dashboard_shimmer_loading.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/widgets/onprocess.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/widgets/performance.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/widgets/unprocess.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/widgets/transactions.dart';
import '../controllers/dashboardv2_controller.dart';

class Dashboardv2View extends GetView<Dashboardv2Controller> {
  Dashboardv2View({Key? key}) : super(key: key);
  @override
  final controller = Get.put(Dashboardv2Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoading.isTrue && controller.error.isEmpty) {
              return Column(
                children: const [
                  ShimmerLoading(),
                  ShimmerLoading(),
                  ShimmerLoading(),
                  ShimmerLoading()
                ],
              );
            } else if (controller.isLoading.isFalse &&
                controller.error.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transactions(),
                  Performance(),
                  Onprocess(
                    controller: controller,
                  ),
                  Unprocess(
                    controller: controller,
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              controller.error.value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: controller.onInit,
                      child: const Text("Retry"),
                    )
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
