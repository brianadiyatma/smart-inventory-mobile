import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/sttp/detail_transaksi_sttp/controllers/detail_transaksi_sttp_controller.dart';
import '../../../../data/detail_transaksi_sttp.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';

class RequestListItemSttp extends StatelessWidget {
  final DetailTransaksiSttpController controller;
  final List<Details> details;
  const RequestListItemSttp(
      {Key? key, required this.details, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.height / 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(7),
                  2: FlexColumnWidth(7),
                  3: FlexColumnWidth(3),
                  4: FlexColumnWidth(8),
                },
                defaultColumnWidth: const IntrinsicColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 4),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 4),
                          child: Text(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 4),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Total",
                          style: AppTextStyle.defaultTheme(context)
                              .caption
                              ?.copyWith(
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 4),
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
                  ...details.map((item) {
                    final int index = details.indexOf(item) + 1;
                    return TableRow(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 209, 209)
                              .withOpacity(0.3)),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Text(
                              index.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTextStyle.defaultTheme(context)
                                  .caption
                                  ?.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 4),
                          child: Text(
                            item.materialDesc.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTextStyle.defaultTheme(context)
                                .caption
                                ?.copyWith(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 4),
                          child: Text(
                            item.materialCode.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTextStyle.defaultTheme(context)
                                .caption
                                ?.copyWith(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 4),
                            child: Text(
                              item.qtyPo.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTextStyle.defaultTheme(context)
                                  .caption
                                  ?.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    if (item.status != 3) {
                                      final result = await Get.toNamed(
                                          '/informasi-detail-sttp',
                                          arguments: {
                                            'id': item.id,
                                            'refresh': controller.onInit
                                          });
                                    } else {
                                      null;
                                    }
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: item.status == 3
                                          ? AppColor.success
                                          : item.status == 1
                                              ? AppColor.error
                                              : AppColor.primary,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        item.status == 3
                                            ? "Processed".toUpperCase()
                                            : item.status == 1
                                                ? "Unprocessed".toUpperCase()
                                                : "On Process".toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
