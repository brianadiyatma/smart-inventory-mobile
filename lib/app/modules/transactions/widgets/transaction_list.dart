import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final TransactionsController controller;
  const TransactionList(
      {super.key,
      this.type,
      this.tanggal,
      this.status,
      this.pembuat,
      this.noDok,
      required this.controller,
      this.fiscalYear});

  final String? type;
  final String? noDok;
  final String? tanggal;
  final String? status;
  final String? pembuat;
  final String? fiscalYear;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.grey[100]!,
                Colors.white,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          splashColor: AppColor.primary.shade50,
          onTap: () async {
            if (type == "STTP") {
              final result = await Get.toNamed('/detail-transaksi-sttp',
                  arguments: {
                    'docNum': 'STTP/$noDok/$fiscalYear',
                    'refreshes': controller.getTransactionList
                  });
            } else if (type == "BPM") {
              final result = await Get.toNamed('/detail-transaksi-bpm',
                  arguments: {
                    'docNum': 'BPM/$noDok/$fiscalYear',
                    'refreshes': controller.getTransactionList
                  });
            }
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      type.toString(),
                      style: AppTextStyle.defaultTheme(context)
                          .bodyMedium
                          ?.copyWith(
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DOC NO : ${noDok.toString()}",
                                  style: AppTextStyle.defaultTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: status == "PROCESSED"
                                          ? Colors.green
                                          : status == "ON PROCESS"
                                              ? Colors.blue[800]
                                              : Colors.red),
                                  child: Text(
                                    status.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.defaultTheme(context)
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 5,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Author :",
                                  style: AppTextStyle.defaultTheme(context)
                                      .bodySmall
                                      ?.copyWith(
                                          color: AppColor.black.shade50,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  pembuat.toString(),
                                  style: AppTextStyle.defaultTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date | Time :",
                                  style: AppTextStyle.defaultTheme(context)
                                      .bodySmall
                                      ?.copyWith(
                                          color: AppColor.black.shade50,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('E, d MMM yyyy | HH:mm').format(
                                      DateTime.parse(tanggal.toString())),
                                  style: AppTextStyle.defaultTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
