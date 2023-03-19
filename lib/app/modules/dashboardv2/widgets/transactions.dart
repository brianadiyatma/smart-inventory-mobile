import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboardv2/controllers/dashboardv2_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/notifications/views/notifications_view.dart';
import 'package:intl/intl.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets_util.dart';
import '../../dashboardv2/widgets/dropdown.dart';

class Transactions extends StatelessWidget {
  String currentDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  Transactions({Key? key}) : super(key: key);

  final controller = Get.put(Dashboardv2Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          height: 35,
                          AssetsUtil.imageLogoAppBorder,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("SMART INVENTORY",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(currentDate,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() {
                        return InkWell(
                          splashColor: AppColor.primary.shade50,
                          onTap: () {
                            Get.toNamed('/profile');
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1))
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        controller.profilePic.value.isNotEmpty
                                            ? Image.memory(base64Decode(
                                                    controller.profilePic.value
                                                        .toString()))
                                                .image
                                            : const AssetImage(
                                                AssetsUtil.profileNotFound))),
                          ),
                        );
                      }),
                      InkWell(
                        splashColor: AppColor.primary.shade50,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsView()),
                          );
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              CupertinoIcons.bell_fill,
                              size: 34,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue[600]!,
                              Colors.blue[800]!,
                            ],
                            begin: const FractionalOffset(0.3, 0.0),
                            end: const FractionalOffset(0.9, 0.5),
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 7,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 3),
                                            child: Icon(
                                              CupertinoIcons.list_bullet_indent,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text("Transactions",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [CustomDropdown()],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 15, bottom: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.dashboardData.value.data!
                                              .header![0].count
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "Total Inbound",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.dashboardData.value.data!
                                              .header![1].count
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "Total Outbound",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
