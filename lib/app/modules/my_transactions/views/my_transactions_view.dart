import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dashboard_shimmer_loading.dart';
import '../controllers/my_transactions_controller.dart';
import '../widgets/MySearchField.dart';
import '../widgets/my_transaction_list.dart';

class MyTransactionsView extends GetView<MyTransactionsController> {
  const MyTransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      controller.typeTransaction == null
                          ? 'My Transaction'
                          : 'Document Unprocessed',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.getTransactionList();
              },
              child: Column(children: [
                const MySearchField(),
                Expanded(child: Obx(
                  () {
                    return Center(
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
                                        return MyTransactionList(
                                          noDok: controller
                                              .listDokumen[index].docNumber
                                              .toString(),
                                          pembuat: controller
                                              .listDokumen[index].pembuat
                                              .toString(),
                                          status: controller
                                              .listDokumen[index].status
                                              .toString(),
                                          tanggal: controller.listDokumen[index]
                                                      .enterDate !=
                                                  null
                                              ? controller
                                                  .listDokumen[index].enterDate
                                                  .toString()
                                              : controller
                                                  .listDokumen[index].createdAt
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
                                              : const Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Center(
                                                    child: Text('No Data left'),
                                                  ),
                                                );
                                        });
                                      }
                                    })
                                : ElevatedButton(
                                    onPressed: (() {
                                      controller.getTransactionList();
                                    }),
                                    child: const Text(
                                      "Retry",
                                    ))
                            : ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const ShimmerLoading();
                                }));
                  },
                )),
              ]),
            )));
  }
}
