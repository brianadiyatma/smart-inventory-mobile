// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inka_smart_inventory_mobile/app/modules/bpm/detail_transaksi_bpm/controllers/detail_transaksi_bpm_controller.dart';

import '../../../../data/detail_transaksi_bpm.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';

class RequestListItemBpm extends StatelessWidget {
  final DetailTransaksiBpmController controller;
  final List<Details> details;
  const RequestListItemBpm({
    Key? key,
    required this.controller,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 10,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(9),
                            2: FlexColumnWidth(5),
                            3: FlexColumnWidth(6),
                            4: FlexColumnWidth(3),
                          },
                          defaultColumnWidth: const IntrinsicColumnWidth(),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: const TableBorder(
                            bottom: BorderSide(
                              width: 1.3,
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                            horizontalInside: BorderSide(
                                width: 1.3,
                                color: Colors.white,
                                style: BorderStyle.solid),
                          ),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.3),
                              ),
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "No",
                                      style: AppTextStyle.defaultTheme(context)
                                          .caption
                                          ?.copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Name",
                                      style: AppTextStyle.defaultTheme(context)
                                          .caption
                                          ?.copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Reservation",
                                      style: AppTextStyle.defaultTheme(context)
                                          .caption
                                          ?.copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Code",
                                      style: AppTextStyle.defaultTheme(context)
                                          .caption
                                          ?.copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Quantity",
                                      style: AppTextStyle.defaultTheme(context)
                                          .caption
                                          ?.copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...details.map((
                              item,
                            ) {
                              final int index = details.indexOf(item) + 1;
                              return TableRow(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 209, 209, 209)
                                        .withOpacity(0.3)),
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        index.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            AppTextStyle.defaultTheme(context)
                                                .caption
                                                ?.copyWith(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        item.materialDesc
                                            .toString()
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style:
                                            AppTextStyle.defaultTheme(context)
                                                .caption
                                                ?.copyWith(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        item.reservationNumber.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            AppTextStyle.defaultTheme(context)
                                                .caption
                                                ?.copyWith(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        item.materialCode.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            AppTextStyle.defaultTheme(context)
                                                .caption
                                                ?.copyWith(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        item.orderQty.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            AppTextStyle.defaultTheme(context)
                                                .caption
                                                ?.copyWith(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.height / 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                        },
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: const TableBorder(
                          bottom: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                          horizontalInside: BorderSide(
                              width: 1.3,
                              color: Colors.white,
                              style: BorderStyle.solid),
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.3),
                            ),
                            children: [
                              SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Status",
                                    style: AppTextStyle.defaultTheme(context)
                                        .caption
                                        ?.copyWith(
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...details.map((
                            item,
                          ) {
                            final int index = details.indexOf(item) + 1;
                            return TableRow(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 209, 209, 209)
                                      .withOpacity(0.3)),
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 7,
                                              right: 7),
                                          child: InkWell(
                                            onTap: item.status == 3
                                                ? null
                                                : () async {
                                                    final result =
                                                        await Get.toNamed(
                                                            '/informasi-detail-bpm',
                                                            arguments: {
                                                          'id': item.id,
                                                          'refresh':
                                                              controller.onInit
                                                        });
                                                  },
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                color: item.status == 3
                                                    ? AppColor.success
                                                    : item.status == 1
                                                        ? AppColor.error
                                                        : AppColor.primary,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              child: Center(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  item.status == 3
                                                      ? "Processed"
                                                          .toUpperCase()
                                                      : item.status == 1
                                                          ? "Unprocessed"
                                                              .toUpperCase()
                                                          : "On Process"
                                                              .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
