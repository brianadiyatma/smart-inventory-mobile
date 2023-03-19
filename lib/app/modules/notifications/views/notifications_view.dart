import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/notification_list.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchNotification();
        },
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (controller.error.value.isEmpty &&
                  controller.notificationsList.isNotEmpty) {
                return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.notificationsList.length + 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      if (index < controller.notificationsList.length) {
                        return NotificationList(
                          bodyNotification:
                              controller.notificationsList[index].body,
                          titleNotification:
                              controller.notificationsList[index].title,
                          createdAt:
                              controller.notificationsList[index].createdAt,
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
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }));
                      }
                    });
              } else if (controller.notificationsList.isEmpty &&
                  controller.error.value.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("No Notification"),
                      ElevatedButton(
                          onPressed: controller.fetchNotification,
                          child: const Text("Coba Lagi"))
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(controller.error.value.toString())),
                      ElevatedButton(
                          onPressed: controller.fetchNotification,
                          child: const Text("Coba Lagi"))
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
