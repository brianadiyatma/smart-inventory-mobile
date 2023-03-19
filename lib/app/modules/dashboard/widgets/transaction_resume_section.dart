// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';

import 'package:inka_smart_inventory_mobile/app/data/data_transaction_section.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bottom_navigator/controllers/bottom_navigator_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/transaction_resume_list.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:inka_smart_inventory_mobile/app/utils/assets_util.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import 'package:intl/intl.dart';

class TransactionResumeSection extends StatelessWidget {
  final String period;
  const TransactionResumeSection({
    Key? key,
    this.dataTransactionSection,
    required this.period,
  }) : super(key: key);
  final List<Transaction>? dataTransactionSection;
  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put<BottomNavigatorController>(BottomNavigatorController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 8),
              child: Text(
                "$period Transaction",
                style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.black),
              ),
            ),
            InkWell(
              onTap: () {
                controller.changeTabIndex(1);
              },
              splashColor: AppColor.primary.shade50,
              child: Padding(
                padding: const EdgeInsets.only(right: 14, bottom: 8),
                child: Text(
                  "View more",
                  style: AppTextStyle.defaultTheme(context)
                      .bodyMedium
                      ?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: dataTransactionSection!.isNotEmpty
              ? ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: dataTransactionSection?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                if (dataTransactionSection![index].type ==
                                    "BPM") {
                                  Get.toNamed('/detail-transaksi-bpm',
                                      arguments:
                                          "${dataTransactionSection![index].type}/${dataTransactionSection![index].docNumber}/${dataTransactionSection![index].fiscalYear}");
                                } else if (dataTransactionSection![index]
                                        .type ==
                                    "STTP") {
                                  Get.toNamed('/detail-transaksi-sttp',
                                      arguments:
                                          "${dataTransactionSection![index].type}/${dataTransactionSection![index].docNumber}/${dataTransactionSection![index].fiscalYear}");
                                } else {
                                  CustomSnackbar.snackbarFailed(
                                      title: "Error", message: "Invalid Data");
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TransactionResumeList(
                                        text1: "Tgl :",
                                        text2: DateFormat.yMMMMd().format(
                                            DateTime.parse(
                                                dataTransactionSection![index]
                                                    .createdAt
                                                    .toString()))),
                                    TransactionResumeList(
                                        text1: "Doc :",
                                        text2: dataTransactionSection![index]
                                            .type
                                            .toString()),
                                    TransactionResumeList(
                                        text1: "No :",
                                        text2: dataTransactionSection![index]
                                            .docNumber
                                            .toString()),
                                    AssetsUtil.idconDownloadDone
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : const Center(child: Text("No Data")),
        )
      ],
    );
  }
}
