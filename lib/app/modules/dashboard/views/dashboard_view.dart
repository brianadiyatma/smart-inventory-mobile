import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dashboard_shimmer_loading.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/documen_section.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/header_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/storage_info_section.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/transaction_resume_section.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/app_bar_inka.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBarInka(
        appBar: AppBar(),
        notifications: true,
        profile: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getDashboardInformationFun();
          // controller.getHeaderDashboard();
          // controller.getTransactionSection();
          // controller.getTransactionNotProcess();
          // controller.getMaterialInformation();
        },
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: Obx(
                () {
                  if (controller.error.isEmpty && controller.isLoading.value) {
                    // return Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: MediaQuery.of(context).size.height,
                    //     child:
                    //         const Center(child: CircularProgressIndicator()));
                    return Column(
                      children: const [
                        ShimmerLoading(),
                        ShimmerLoading(),
                        ShimmerLoading(),
                        ShimmerLoading()
                      ],
                    );
                  } else if (controller.error.isNotEmpty &&
                      !controller.isLoading.value) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("No Information"),
                            ElevatedButton(
                                onPressed:
                                    controller.getDashboardInformationFun,
                                child: const Text("Coba Lagi"))
                          ],
                        ),
                      ),
                    );
                  } else if (controller.error.isEmpty &&
                      !controller.isLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderDashboard(
                              dataHeaderDashboard:
                                  controller.dashboardData.value.data!.header!),
                          const SizedBox(
                            height: 28,
                          ),
                          DocumentSection(
                              dataTransactionNotProcess: controller
                                  .dashboardData.value.data!.transactionNot!),
                          const SizedBox(
                            height: 20,
                          ),
                          StorageInfoSection(
                              dataMaterialInformation: controller
                                  .dashboardData.value.data!.material!),
                          const SizedBox(
                            height: 20,
                          ),
                          TransactionResumeSection(
                            period: controller.selectedPeriod.value.toString(),
                            dataTransactionSection: controller
                                .dashboardData.value.data!.transactionToday!,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("No Information"),
                            ElevatedButton(
                                onPressed:
                                    controller.getDashboardInformationFun,
                                child: const Text("Coba Lagi"))
                          ],
                        ),
                      ),
                    );
                  }
                },
              )),
        ),
      ),
    );
  }
}
