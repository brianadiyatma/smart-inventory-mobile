import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/controllers/dashboardv2_controller.dart';
import '../../../themes/app_colors.dart';

class Onprocess extends StatelessWidget {
  Dashboardv2Controller controller;
  Onprocess({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("My Transaction",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  splashColor: AppColor.primary.shade50,
                  onTap: () {
                    Get.toNamed('/my-transactions');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Text("See More",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 110,
                child: controller
                        .dashboardData.value.data!.transactionToday!.isEmpty
                    ? const Center(
                        child: Text("No Data"),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: controller
                            .dashboardData.value.data!.transactionToday!
                            .map(
                          (e) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              child: SizedBox(
                                width: 170,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          e.type.toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .blue[900])),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          e.docNumber
                                                              .toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .grey[800])),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          '${e.countItem} Item Remaining',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .grey[400])),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color: Colors.blue[900],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.blue[800]!,
                                                    Colors.blue[900]!,
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  tileMode: TileMode.clamp),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                            'SEE MORE  >',
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: false,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList()))
          ],
        ),
      ),
    );
  }
}
