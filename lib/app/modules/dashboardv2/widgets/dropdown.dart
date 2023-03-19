import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboardv2_controller.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({Key? key}) : super(key: key);
  final controller = Get.put(Dashboardv2Controller());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Dashboardv2Controller());
    return Obx(() {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[700],
          ),
          child: Container(
              padding: const EdgeInsets.only(left: 10, right: 5),
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
                    child: Icon(CupertinoIcons.arrow_down_circle_fill)),
                iconSize: 16,
                iconEnabledColor: Colors.white,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                dropdownColor: Colors.blue[700],
                underline: Container(),
                isExpanded: false,
              )));
    });
  }
}
