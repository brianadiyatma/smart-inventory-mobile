import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_history.dart';

import '../controllers/detail_material_controller.dart';

class HistoryMaterial extends StatelessWidget {
  DetailMaterialController controller = Get.put(DetailMaterialController());

  HistoryMaterial({
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
              if (controller.isLoadingHis.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.isLoadingHis.value == false &&
                  controller.historyDataContent.length == 0) {
                return const Center(
                  child: Text('Data tidak ditemukan'),
                );
              } else if (controller.isLoadingHis.value == false &&
                  controller.errorHis.value.isNotEmpty) {
                return Center(
                  child: Text(controller.errorHis.value),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: controller.scrollHistoryController,
                          itemCount: controller.historyDataContent.length + 1,
                          itemBuilder: (context, index) {
                            if (index < controller.historyDataContent.length) {
                              return ItemHistory(
                                data: controller.historyDataContent[index],
                              );
                            } else {
                              if (controller.isLastPageHistory.value) {
                                return const Center(
                                  child: Text('Tidak ada data lagi'),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }
                          }),
                    ),
                  ],
                );
              }
            })),
      ),
    );
  }
}
