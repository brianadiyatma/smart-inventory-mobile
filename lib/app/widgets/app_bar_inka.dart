import 'package:flutter/material.dart';
import 'package:inka_smart_inventory_mobile/app/modules/notifications/views/notifications_view.dart';
import 'package:inka_smart_inventory_mobile/app/modules/profile/views/profile_view.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:inka_smart_inventory_mobile/app/utils/assets_util.dart';

class AppBarInka extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final bool profile;
  final bool notifications;
  const AppBarInka(
      {Key? key,
      required this.appBar,
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
                    Icons.notifications,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsView()),
                    );
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                )
              : const SizedBox.shrink();
        },
      ),
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsUtil.imageLogoApp,
            width: 60,
          ),
          Text(
            "Smart Inventory".toUpperCase(),
            style: AppTextStyle.defaultTheme(context)
                .caption
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: <Widget>[
        profile
            ? IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 27,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileView()),
                  );
                },
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
