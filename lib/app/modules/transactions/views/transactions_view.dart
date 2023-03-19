import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dashboard_shimmer_loading.dart';
import 'package:inka_smart_inventory_mobile/app/modules/transactions/widgets/SearchField.dart';
import 'package:inka_smart_inventory_mobile/app/modules/transactions/widgets/transaction_list.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/app_bar_blue.dart';
import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put<TransactionsController>(TransactionsController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBarBlue(
              profile: true,
              notifications: true,
              appBar: AppBar(),
              title: const Text("Transaction History"),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.getTransactionList();
              },
              child: Obx(() {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    const SearchField(),
                    Expanded(
                      child: Center(
                          child: !controller.isLoading.value
                              ? controller.errorTransactionList.isEmpty
                                  ? ListView.builder(
                                      controller: controller.scrollController,
                                      itemCount:
                                          controller.listDokumen.length + 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index <
                                            controller.listDokumen.length) {
                                          return TransactionList(
                                            controller: controller,
                                            noDok: controller
                                                .listDokumen[index].docNumber
                                                .toString(),
                                            pembuat: controller
                                                .listDokumen[index].pembuat
                                                .toString(),
                                            status: controller
                                                .listDokumen[index].status
                                                .toString(),
                                            tanggal: controller
                                                        .listDokumen[index]
                                                        .enterDate !=
                                                    null
                                                ? controller.listDokumen[index]
                                                    .enterDate
                                                    .toString()
                                                : controller.listDokumen[index]
                                                    .createdAt
                                                    .toString(),
                                            type: controller
                                                .listDokumen[index].type
                                                .toString(),
                                            fiscalYear: controller
                                                .listDokumen[index].fiscalYear
                                                .toString(),
                                          );
                                        } else {
                                          return Obx(() {
                                            return controller.isloadMore.value
                                                ? const Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 30),
                                                    child: Center(
                                                        child: Text(
                                                            'No Data left')),
                                                  );
                                          });
                                        }
                                      })
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(controller
                                            .errorTransactionList.value),
                                        ElevatedButton(
                                            onPressed: (() {
                                              controller.getTransactionList();
                                            }),
                                            child: const Text(
                                              "Retry",
                                            )),
                                      ],
                                    )
                              : ListView.builder(
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const ShimmerLoading();
                                  })),
                    ),
                  ]),
                );
              }),
            )));
  }
}
