import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/gudang/gudang_view/widget/list_gudang.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import '../../../../widgets/app_bar_blue.dart';
import '../widget/search_warehouse.dart';
import '../controllers/gudang_controller.dart';

class GudangView extends GetView<GudangController> {
  const GudangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GudangController());
    return Scaffold(
        appBar: AppBarBlue(
          appBar: AppBar(),
          title: const Text("Warehouse"),
          notifications: true,
          profile: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getWarehouseList();
            controller.isLastPage.value = false;
            controller.page = 1;
          },
          child: Column(children: [
            Searchwarehouse(
              controller: controller.searchController,
              onChange: () {
                controller.getWarehouseList();
              },
            ),
            Expanded(child: Center(child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.error.value.isEmpty &&
                    controller.storageList.isNotEmpty) {
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.storageList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.storageList.length) {
                        return Itemgudang(
                          warehouse: controller.storageList[index],
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Obx(() {
                              if (controller.isLastPage.value) {
                                return const Center(
                                  child: Text('Tidak ada data lagi'),
                                );
                              } else {
                                if (controller.isLastPage.value) {
                                  return const Center(
                                    child: Text('No More Data to Load'),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }
                            }));
                      }
                    },
                  );
                } else if (controller.error.value.isNotEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(controller.error.value),
                      MaterialButton(
                          color: AppColor.primary,
                          onPressed: () {
                            controller.onInit();
                          },
                          child: const Text("Try Again",
                              style: TextStyle(color: Colors.white)))
                    ],
                  );
                } else if (controller.storageList.isEmpty &&
                    !controller.isLoading.value) {
                  return const Center(
                    child: Text('Data Not Found'),
                  );
                } else {
                  return const Center(
                    child: Text("No Data"),
                  );
                }
              }
            })))
          ]),
        ));
  }
}
