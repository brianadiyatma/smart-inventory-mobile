import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_material_information.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bottom_navigator/controllers/bottom_navigator_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/storage_info_list.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/storage_popup.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import 'package:intl/intl.dart';

class StorageInfoSection extends StatelessWidget {
  const StorageInfoSection({Key? key, this.dataMaterialInformation})
      : super(key: key);
  final List<MaterialInfo>? dataMaterialInformation;
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
                "Material Information",
                style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.black),
              ),
            ),
            InkWell(
              onTap: () {
                controller.changeTabIndex(3);
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
          margin: const EdgeInsets.only(top: 8),
          height: 140,
          child: dataMaterialInformation!.isNotEmpty
              ? ListView.builder(
                  itemCount: dataMaterialInformation!.length,
                  padding: const EdgeInsets.only(left: 14),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 200,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Detail Information",
                                content: StoragePopup(
                                    materialInfo:
                                        dataMaterialInformation![index]),
                                confirm: TextButton(
                                    onPressed: Get.back, child: Text("OK")));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StorageInfoList(
                                    text: dataMaterialInformation![index]
                                        .materialCodes
                                        .toString()
                                        .toUpperCase(),
                                    icon: const Icon(
                                      Icons.dns_sharp,
                                      size: 18,
                                    ),
                                    color: Colors.black),
                                StorageInfoList(
                                    text: dataMaterialInformation![index]
                                        .materialCode
                                        .toString(),
                                    icon: const Icon(
                                      Icons.table_view_sharp,
                                      size: 18,
                                    ),
                                    color: Colors.black),
                                StorageInfoList(
                                    text: dataMaterialInformation![index]
                                        .qty
                                        .toString(),
                                    icon: const Icon(
                                      Icons.all_inbox_sharp,
                                      size: 18,
                                    ),
                                    color: Colors.grey.shade500),
                                StorageInfoList(
                                    text: DateFormat.yMMMd().format(
                                        DateTime.parse(
                                            dataMaterialInformation![index]
                                                .grDate
                                                .toString())),
                                    icon: const Icon(
                                      Icons.date_range,
                                      size: 18,
                                    ),
                                    color: AppColor.black.shade700),
                                StorageInfoList(
                                    text: dataMaterialInformation![index]
                                        .binCode
                                        .toString(),
                                    icon: const Icon(
                                      Icons.home_work_sharp,
                                      size: 18,
                                    ),
                                    color: AppColor.black.shade700),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("No Data"),
                ),
        )
      ],
    );
  }
}
