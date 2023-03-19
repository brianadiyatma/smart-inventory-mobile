import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/material/detail_material/controllers/detail_material_controller.dart';

import '../widgets/list_stock.dart';

class StockLocation extends StatelessWidget {
  DetailMaterialController controller = Get.put(DetailMaterialController());

  StockLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: Obx(() {
              if (controller.isLoadingLoc.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.isLoadingLoc.value == false &&
                  controller.storageDataContent.length == 0) {
                return const Center(
                  child: Text('Data tidak ditemukan'),
                );
              } else if (controller.isLoadingLoc.value == false &&
                  controller.errorLoc.value.isNotEmpty) {
                return Center(
                  child: Text(controller.errorLoc.value),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller.scrollLocController,
                        itemCount: controller.storageDataContent.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.storageDataContent.length) {
                            return ItemStockLocation(
                              data: controller.storageDataContent[index],
                            );
                          } else {
                            if (controller.isLastPageLoc.value) {
                              return const Center(
                                child: Text('Tidak ada data lagi'),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            })),
      ),
    );
  }
}
