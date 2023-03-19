// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_style.dart';
import '../controllers/notifications_controller.dart';

class NotificationList extends StatelessWidget {
  String? titleNotification;
  String? bodyNotification;
  String? createdAt;
  NotificationList({
    Key? key,
    this.titleNotification,
    this.bodyNotification,
    this.createdAt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());
    return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Get.to(AppPages.LOGIN);
                },
                splashColor: AppColor.primary.shade50,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Image.asset(
                                          'assets/images/pesan.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 300,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat('dd MMM yyyy HH:mm')
                                                    .format(DateTime.parse(
                                                        createdAt!)),
                                                style:
                                                    AppTextStyle.defaultTheme(
                                                            context)
                                                        .bodySmall
                                                        ?.copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10),
                                              ),
                                              Container(
                                                height: 5,
                                              ),
                                              Text(
                                                titleNotification.toString(),
                                                style: AppTextStyle
                                                        .defaultTheme(context)
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Container(
                                                height: 2,
                                              ),
                                              Text(
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                style:
                                                    AppTextStyle.defaultTheme(
                                                            context)
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                              )
                                            ],
                                            // children: [

                                            // ],
                                          )),
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
