import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/controllers/dashboardv2_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/my_transactions/bindings/my_transactions_binding.dart';
import 'package:inka_smart_inventory_mobile/app/modules/my_transactions/views/my_transactions_view.dart';
import '../../../themes/app_colors.dart';

class Unprocess extends StatelessWidget {
  Dashboardv2Controller controller;
  Unprocess({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Unprocess",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    splashColor: AppColor.primary.shade50,
                    onTap: () {
                      Get.to(() => const MyTransactionsView(),
                          binding: MyTransactionsBinding(),
                          arguments: {
                            'status': 'UNPROCESSED',
                            'page': true,
                            'title': 'Document Unprocessed'
                          });
                    },
                    child: Text("See More",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
                color: Colors.white,
                child: controller
                        .dashboardData.value.data!.transactionNot!.isEmpty
                    ? const Center(
                        child: Text("No Data"),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.vertical,
                        children: controller
                            .dashboardData.value.data!.transactionNot!
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 4,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (e.type == "STTP") {
                                        Get.toNamed('/detail-transaksi-sttp',
                                            arguments: {
                                              'docNum':
                                                  "STTP/${e.docNumber}/${e.fiscalYear}",
                                              'refreshes': controller
                                                  .getDashboardInformationFun
                                            });
                                      } else if (e.type == "BPM") {
                                        Get.toNamed('/detail-transaksi-bpm',
                                            arguments: {
                                              'docNum':
                                                  "BPM/${e.docNumber}/${e.fiscalYear}",
                                              'refreshes': controller
                                                  .getDashboardInformationFun
                                            });
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Center(
                                                child: Text('Tgl: ${e.docDate}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color:
                                                            Colors.grey[800])),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Center(
                                                child: Text('Dok: ${e.type}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color:
                                                            Colors.grey[800])),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Center(
                                                child: Text(
                                                    'No: ${e.docNumber}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color:
                                                            Colors.grey[800])),
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Center(
                                                  child: Icon(
                                                CupertinoIcons.arrow_right,
                                                size: 22,
                                                color: Colors.black,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList())),
          )
        ],
      ),
    );
  }
}
