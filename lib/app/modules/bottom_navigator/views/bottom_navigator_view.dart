import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/material/material_view/views/material_view.dart';
import '../../dashboardv2/views/dashboardv2_view.dart';
import '../../gudang/gudang_view/views/gudang_view.dart';
import '../../qrcode/views/qrcode_view.dart';
import '../controllers/bottom_navigator_controller.dart';
import '../../transactions/views/transactions_view.dart';

class BottomNavigatorView extends StatelessWidget {
  BottomNavigatorView({Key? key}) : super(key: key);

  List<Widget> body = [
    Dashboardv2View(),
    const TransactionsView(),
    QrcodeView(),
    MaterialView(),
    const GudangView()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigatorController>(builder: (controller) {
      return Scaffold(
        body: Obx(() {
          return Center(
            child: body[controller.tabIndex.value],
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.blue[800],
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(CupertinoIcons.house_alt_fill),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                label: 'Transactions',
                icon: Icon(CupertinoIcons.folder_fill),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                label: 'Scan',
                icon: Icon(CupertinoIcons.qrcode_viewfinder),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                label: 'Materials',
                icon: Icon(CupertinoIcons.square_grid_2x2_fill),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                label: 'Warehouse',
                icon: Icon(CupertinoIcons.building_2_fill),
                backgroundColor: Colors.white),
          ],
        ),
      );
    });
  }
}
