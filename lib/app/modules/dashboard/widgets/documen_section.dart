import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bottom_navigator/controllers/bottom_navigator_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/document_section_list.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import 'package:intl/intl.dart';

class DocumentSection extends StatelessWidget {
  const DocumentSection({Key? key, this.dataTransactionNotProcess})
      : super(key: key);
  final List<Transaction>? dataTransactionNotProcess;

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
                "Doc Unprocessed",
                style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.black),
              ),
            ),
            Flexible(
              child: InkWell(
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
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: FittedBox(
                  child: dataTransactionNotProcess!.isNotEmpty
                      ? DataTable(
                          columns: [
                            DocumentSectionList.buildDataColumn(context, "No"),
                            DocumentSectionList.buildDataColumn(
                                context, "Document"),
                            DocumentSectionList.buildDataColumn(
                                context, "Document No."),
                            DocumentSectionList.buildDataColumn(
                                context, "Date"),
                          ],
                          rows: List.generate(
                              dataTransactionNotProcess!.length,
                              (index) => DataRow(
                                      onLongPress: () {
                                        if (dataTransactionNotProcess![index]
                                                .type ==
                                            "BPM") {
                                          Get.toNamed('/detail-transaksi-bpm',
                                              arguments:
                                                  "${dataTransactionNotProcess![index].type}/${dataTransactionNotProcess![index].docNumber}/${dataTransactionNotProcess![index].fiscalYear}");
                                        } else if (dataTransactionNotProcess![
                                                    index]
                                                .type ==
                                            "STTP") {
                                          Get.toNamed('/detail-transaksi-sttp',
                                              arguments:
                                                  "${dataTransactionNotProcess![index].type}/${dataTransactionNotProcess![index].docNumber}/${dataTransactionNotProcess![index].fiscalYear}");
                                        } else {
                                          CustomSnackbar.snackbarFailed(
                                              title: "Error",
                                              message: "Invalid Data");
                                        }
                                      },
                                      cells: [
                                        DocumentSectionList.buildDataCell(
                                            context, (index + 1).toString()),
                                        DocumentSectionList.buildDataCell(
                                            context,
                                            dataTransactionNotProcess![index]
                                                .type
                                                .toString()),
                                        DocumentSectionList.buildDataCell(
                                            context,
                                            dataTransactionNotProcess![index]
                                                .docNumber
                                                .toString()),
                                        DocumentSectionList.buildDataCell(
                                            context,
                                            DateFormat.yMMMd().format(
                                                DateTime.parse(
                                                    dataTransactionNotProcess![
                                                            index]
                                                        .docDate
                                                        .toString()))),
                                      ])),
                        )
                      : const Center(
                          child: Text("No Data"),
                        ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
