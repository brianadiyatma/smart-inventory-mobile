import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bottom_navigator/controllers/bottom_navigator_controller.dart';
import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dropdown.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';
import 'package:inka_smart_inventory_mobile/app/utils/assets_util.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
    this.dataHeaderDashboard,
  }) : super(key: key);

  final List<Header>? dataHeaderDashboard;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BottomNavigatorController());
    return Container(
      color: AppColor.primary,
      padding: const EdgeInsets.only(top: 8, left: 14, right: 14, bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(AppColor.primaryLight),
                  ),
                  onPressed: () {
                    controller.changeTabIndex(1);
                  },
                  icon: AssetsUtil.iconTransactionOutline,
                  label: Text(
                    "Transaction",
                    style:
                        AppTextStyle.defaultTheme(context).labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                const CustomDropdown()
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dataHeaderDashboard![0].count.toString(),
                          style: AppTextStyle.defaultTheme(context)
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total ${dataHeaderDashboard![0].type}",
                          style: AppTextStyle.defaultTheme(context)
                              .caption
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black.shade50),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: 1,
                            color: AppColor.black.shade50,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dataHeaderDashboard![1].count.toString(),
                          style: AppTextStyle.defaultTheme(context)
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total ${dataHeaderDashboard![1].type}",
                          style: AppTextStyle.defaultTheme(context)
                              .caption
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black.shade50),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
