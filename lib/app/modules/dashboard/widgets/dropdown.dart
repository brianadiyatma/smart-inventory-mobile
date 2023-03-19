import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Obx(() {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(50),
            color: AppColor.primary,
          ),
          child: Container(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: DropdownButton(
                isDense: true,
                value: controller.selectedPeriod.value.isNotEmpty
                    ? controller.selectedPeriod.value
                    : null,
                items: const [
                  DropdownMenuItem(
                      value: "This Year", child: Text("This Year")),
                  DropdownMenuItem(
                      value: "This Month", child: Text("This Month")),
                  DropdownMenuItem(
                      value: "This Week", child: Text("This Week")),
                  DropdownMenuItem(value: "Today", child: Text("Today")),
                ],
                onChanged: (value) {
                  controller.selectedPeriod.value = value.toString();
                  controller.getDashboardInformationFun();
                },
                icon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(CupertinoIcons.back)),
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                dropdownColor: AppColor.primary,
                underline: Container(),
                isExpanded: false,
              )));
    });
  }
}
