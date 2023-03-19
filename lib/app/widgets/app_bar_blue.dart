import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/notifications/views/notifications_view.dart';
import 'package:inka_smart_inventory_mobile/app/modules/profile/views/profile_view.dart';

class AppBarBlue extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Text title;
  final bool profile;
  final bool notifications;

  const AppBarBlue(
      {Key? key,
      required this.appBar,
      required this.title,
      required this.profile,
      required this.notifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return notifications
              ? IconButton(
                  icon: const Icon(
                    CupertinoIcons.bell_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.toNamed('/notifications');
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                )
              : const SizedBox.shrink();
        },
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.blue[900],
      title: title,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      actions: <Widget>[
        profile
            ? IconButton(
                icon: const Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  Get.toNamed('/profile');
                },
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
