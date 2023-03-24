import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/transactions/controllers/transactions_controller.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TransactionsController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: "Filtering  Data : ",
          cancel: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          confirm: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => controller.confirmFilter(),
          ),
          content: GetBuilder<TransactionsController>(
              builder: (_) => Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(
                            () {
                              return ExpansionTile(
                                initiallyExpanded: true,
                                title: Text("Document Status".tr,
                                    style: Get.textTheme.bodyText2),
                                children: List.generate(
                                    controller.statusDoc.length, (index) {
                                  return CheckboxListTile(
                                      title: Text(
                                        controller.statusDoc
                                            .elementAt(index)["title"],
                                        style: Get.textTheme.bodyText1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        maxLines: 1,
                                      ),
                                      value: controller.statusDoc
                                          .elementAt(index)['isCheck'],
                                      onChanged: ((value) {
                                        controller.statusChange(value!, index);
                                        controller.update();
                                      }));
                                }),
                              );
                            },
                          ),
                          Obx(
                            () {
                              return ExpansionTile(
                                title: Text("Document Type".tr,
                                    style: Get.textTheme.bodyText2),
                                children: List.generate(
                                    controller.typeDoc.length, (index) {
                                  return CheckboxListTile(
                                      title: Text(
                                        controller.typeDoc
                                            .elementAt(index)["title"],
                                        style: Get.textTheme.bodyText1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        maxLines: 1,
                                      ),
                                      value: controller.typeDoc
                                          .elementAt(index)['isCheck'],
                                      onChanged: ((value) {
                                        controller.typeChange(value!, index);
                                      }));
                                }),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )),
        );
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.blue[900],
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
        child: const Icon(
          CupertinoIcons.list_bullet,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
