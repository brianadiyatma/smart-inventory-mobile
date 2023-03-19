import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/material/material_view/widgets/list_material.dart';
import 'package:inka_smart_inventory_mobile/app/modules/material/material_view/widgets/search_material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/app_bar_blue.dart';
import '../controllers/material_controller.dart';

class MaterialView extends GetView<MaterialController> {
  MaterialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialController controller = Get.put(MaterialController());
    return Scaffold(
        appBar: AppBarBlue(
          appBar: AppBar(),
          title: const Text("Materials"),
          notifications: true,
          profile: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.page = 1;
            controller.getMaterialList();
            controller.isLastPage.value = false;
          },
          child: Column(children: [
            const Searchmaterial(),
            Expanded(child: Center(child: Obx(() {
              if (!controller.isLoading.value &&
                  controller.error.value.isEmpty &&
                  controller.materialList.length != 0) {
                return ListView.builder(
                    itemCount: controller.materialList.length + 1,
                    controller: controller.scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.materialList.length) {
                        return Itemmaterial(
                          material: controller.materialList[index],
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Obx(() {
                              if (controller.isLastPage.value) {
                                return const Center(
                                  child: Text('No More Data to Load'),
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
                    });
              } else if (controller.materialList.length == 0 &&
                  !controller.isLoading.value &&
                  controller.error.value.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Data Not Found'),
                    MaterialButton(
                      onPressed: controller.onInit,
                      color: AppColor.primary,
                      child: Text("Try Again",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                );
              } else if (controller.error.value.isNotEmpty) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(controller.error.value),
                      MaterialButton(
                        onPressed: controller.onInit,
                        color: AppColor.primary,
                        child: Text("Try Again",
                            style: TextStyle(color: Colors.white)),
                      )
                    ]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })))
          ]),
        ));
  }
}
