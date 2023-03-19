import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/controllers/dashboardv2_controller.dart';

class Performance extends StatelessWidget {
  Performance({Key? key}) : super(key: key);
  final controller = Get.put(Dashboardv2Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: Icon(
                                        CupertinoIcons.stopwatch_fill,
                                        size: 22,
                                        color: Colors.blue[900],
                                      )),
                                  Text("Your Performance",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Service Hours",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  controller.dashboardData.value.data!
                                      .performance!.laborHours
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Item Processed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  controller.dashboardData.value.data!
                                      .performance!.countItem
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
