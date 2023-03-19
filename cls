warning: LF will be replaced by CRLF in lib/app/routes/app_pages.dart.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in linux/flutter/generated_plugin_registrant.cc.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in linux/flutter/generated_plugin_registrant.h.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in linux/flutter/generated_plugins.cmake.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in macos/Flutter/GeneratedPluginRegistrant.swift.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in windows/flutter/generated_plugin_registrant.cc.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in windows/flutter/generated_plugin_registrant.h.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in windows/flutter/generated_plugins.cmake.
The file will have its original line endings in your working directory
[1mdiff --git a/lib/app/modules/bottom_navigator/views/bottom_navigator_view.dart b/lib/app/modules/bottom_navigator/views/bottom_navigator_view.dart[m
[1mindex 6a05f78..8885906 100644[m
[1m--- a/lib/app/modules/bottom_navigator/views/bottom_navigator_view.dart[m
[1m+++ b/lib/app/modules/bottom_navigator/views/bottom_navigator_view.dart[m
[36m@@ -1,14 +1,11 @@[m
 import 'package:flutter/material.dart';[m
[31m-[m
 import 'package:get/get.dart';[m
[31m-[m
 import '../controllers/bottom_navigator_controller.dart';[m
[31m-[m
 import '../../dashboard/views/dashboard_view.dart';[m
[31m-import '../../profile/views/profile_view.dart';[m
[31m-import '../../notifications/views/notifications_view.dart';[m
 import '../../transactions/views/transactions_view.dart';[m
 import '../../qrcode/views/qrcode_view.dart';[m
[32m+[m[32mimport '../../gudang/views/gudang_view.dart';[m
[32m+[m[32mimport '../../material/views/material_view.dart';[m
 [m
 class BottomNavigatorView extends StatelessWidget {[m
   BottomNavigatorView({Key? key}) : super(key: key);[m
[36m@@ -17,8 +14,8 @@[m [mclass BottomNavigatorView extends StatelessWidget {[m
     const DashboardView(),[m
     const TransactionsView(),[m
     const QrcodeView(),[m
[31m-    const NotificationsView(),[m
[31m-    ProfileView()[m
[32m+[m[32m    const MaterialView(),[m
[32m+[m[32m    const GudangView()[m
   ];[m
 [m
   @override[m
[36m@@ -29,7 +26,7 @@[m [mclass BottomNavigatorView extends StatelessWidget {[m
           child: body[controller.tabIndex],[m
         ),[m
         bottomNavigationBar: BottomNavigationBar([m
[31m-          type: BottomNavigationBarType.shifting,[m
[32m+[m[32m          type: BottomNavigationBarType.fixed,[m
           showUnselectedLabels: true,[m
           unselectedItemColor: Colors.grey[500],[m
           selectedItemColor: Colors.blue[800],[m
[36m@@ -41,7 +38,7 @@[m [mclass BottomNavigatorView extends StatelessWidget {[m
                 icon: Icon(Icons.home),[m
                 backgroundColor: Colors.white),[m
             BottomNavigationBarItem([m
[31m-                label: 'Transactions',[m
[32m+[m[32m                label: 'Transacions',[m
                 icon: Icon(Icons.folder_copy),[m
                 backgroundColor: Colors.white),[m
             BottomNavigationBarItem([m
[36m@@ -49,12 +46,12 @@[m [mclass BottomNavigatorView extends StatelessWidget {[m
                 icon: Icon(Icons.qr_code_scanner),[m
                 backgroundColor: Colors.white),[m
             BottomNavigationBarItem([m
[31m-                label: 'Notifications',[m
[31m-                icon: Icon(Icons.notifications),[m
[32m+[m[32m                label: 'Materials',[m
[32m+[m[32m                icon: Icon(Icons.widgets),[m
                 backgroundColor: Colors.white),[m
             BottomNavigationBarItem([m
[31m-                label: 'Profile',[m
[31m-                icon: Icon(Icons.person),[m
[32m+[m[32m                label: 'Warehouse',[m
[32m+[m[32m                icon: Icon(Icons.warehouse),[m
                 backgroundColor: Colors.white),[m
           ],[m
         ),[m
[1mdiff --git a/lib/app/modules/dashboard/views/dashboard_view.dart b/lib/app/modules/dashboard/views/dashboard_view.dart[m
[1mindex 74c35f3..69a55d9 100644[m
[1m--- a/lib/app/modules/dashboard/views/dashboard_view.dart[m
[1m+++ b/lib/app/modules/dashboard/views/dashboard_view.dart[m
[36m@@ -1,13 +1,10 @@[m
[31m-import 'package:eva_icons_flutter/eva_icons_flutter.dart';[m
 import 'package:flutter/material.dart';[m
[31m-[m
 import 'package:get/get.dart';[m
 import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/dashboard_shimmer_loading.dart';[m
 import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/documen_section.dart';[m
 import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/header_dashboard.dart';[m
 import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/storage_info_section.dart';[m
 import 'package:inka_smart_inventory_mobile/app/modules/dashboard/widgets/transaction_resume_section.dart';[m
[31m-import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';[m
 import 'package:inka_smart_inventory_mobile/app/widgets/app_bar_inka.dart';[m
 [m
 import '../controllers/dashboard_controller.dart';[m
[36m@@ -19,7 +16,11 @@[m [mclass DashboardView extends GetView<DashboardController> {[m
   Widget build(BuildContext context) {[m
     final controller = Get.put(DashboardController());[m
     return Scaffold([m
[31m-      appBar: AppBarInka(appBar: AppBar()),[m
[32m+[m[32m      appBar: AppBarInka([m
[32m+[m[32m        appBar: AppBar(),[m
[32m+[m[32m        notifications: true,[m
[32m+[m[32m        profile: true,[m
[32m+[m[32m      ),[m
       body: RefreshIndicator([m
         onRefresh: () async {[m
           controller.getHeaderDashboard();[m
[1mdiff --git a/lib/app/modules/login/views/login_view.dart b/lib/app/modules/login/views/login_view.dart[m
[1mindex 17be37a..04f4d66 100644[m
[1m--- a/lib/app/modules/login/views/login_view.dart[m
[1m+++ b/lib/app/modules/login/views/login_view.dart[m
[36m@@ -1,15 +1,9 @@[m
[31m-import 'package:flutter/cupertino.dart';[m
 import 'package:flutter/material.dart';[m
 import 'package:get/get.dart';[m
[31m-import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';[m
[31m-[m
 import '../../../themes/app_text_style.dart';[m
 import '../controllers/login_controller.dart';[m
[31m-[m
 import './widgets/nip_form.dart';[m
 import './widgets/password_form.dart';[m
[31m-[m
[31m-// import '../../../routes/app_pages.dart';[m
 import '../../../utils/assets_util.dart';[m
 [m
 class LoginView extends GetView<LoginController> {[m
[1mdiff --git a/lib/app/modules/profile/views/profile_view.dart b/lib/app/modules/profile/views/profile_view.dart[m
[1mindex 327e882..736aa2b 100644[m
[1m--- a/lib/app/modules/profile/views/profile_view.dart[m
[1m+++ b/lib/app/modules/profile/views/profile_view.dart[m
[36m@@ -16,6 +16,8 @@[m [mclass ProfileView extends GetView<ProfileController> {[m
       appBar: AppBarBlue([m
         appBar: AppBar(),[m
         title: const Text("Profile"),[m
[32m+[m[32m        notifications: true,[m
[32m+[m[32m        profile: true,[m
       ),[m
       body: SingleChildScrollView([m
         padding: const EdgeInsets.symmetric(vertical: 20),[m
[1mdiff --git a/lib/app/modules/transactions/views/transactions_view.dart b/lib/app/modules/transactions/views/transactions_view.dart[m
[1mindex d94abb7..e151d61 100644[m
[1m--- a/lib/app/modules/transactions/views/transactions_view.dart[m
[1m+++ b/lib/app/modules/transactions/views/transactions_view.dart[m
[36m@@ -1,7 +1,10 @@[m
 import 'package:flutter/material.dart';[m
[31m-[m
 import 'package:get/get.dart';[m
[31m-[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/modules/detail_transaksi/views/detail_transaksi_view.dart';[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/widgets/search_transaksi.dart';[m
[32m+[m[32mimport '../../../themes/app_colors.dart';[m
[32m+[m[32mimport '../../../themes/app_text_style.dart';[m
[32m+[m[32mimport '../../../widgets/app_bar_blue.dart';[m
 import '../controllers/transactions_controller.dart';[m
 [m
 class TransactionsView extends GetView<TransactionsController> {[m
[36m@@ -9,14 +12,215 @@[m [mclass TransactionsView extends GetView<TransactionsController> {[m
   @override[m
   Widget build(BuildContext context) {[m
     return Scaffold([m
[31m-      appBar: AppBar([m
[31m-        title: const Text('TransactionsView'),[m
[31m-        centerTitle: true,[m
[31m-      ),[m
[31m-      body: Center([m
[31m-        child: Text([m
[31m-          'TransactionsView is working',[m
[31m-          style: TextStyle(fontSize: 20),[m
[32m+[m[32m        appBar: AppBarBlue([m
[32m+[m[32m          appBar: AppBar(),[m
[32m+[m[32m          title: const Text("Transaksi"),[m
[32m+[m[32m          notifications: true,[m
[32m+[m[32m          profile: true,[m
[32m+[m[32m        ),[m
[32m+[m[32m        body: Column(children: [[m
[32m+[m[32m          const Searchtransaksi(),[m
[32m+[m[32m          Expanded([m
[32m+[m[32m              child: Center([m
[32m+[m[32m                  child: ListView.builder([m
[32m+[m[32m                      itemCount: 5,[m
[32m+[m[32m                      itemBuilder: (BuildContext context, int index) {[m
[32m+[m[32m                        return const ItemTransactions();[m
[32m+[m[32m                      }))),[m
[32m+[m[32m        ]));[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mclass ItemTransactions extends StatelessWidget {[m
[32m+[m[32m  const ItemTransactions({super.key});[m
[32m+[m
[32m+[m[32m  @override[m
[32m+[m[32m  Widget build(BuildContext context) {[m
[32m+[m[32m    return Padding([m
[32m+[m[32m      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),[m
[32m+[m[32m      child: Card([m
[32m+[m[32m        color: Colors.white,[m
[32m+[m[32m        child: InkWell([m
[32m+[m[32m          splashColor: AppColor.primary.shade50,[m
[32m+[m[32m          onTap: () {[m
[32m+[m[32m            Navigator.push([m
[32m+[m[32m              context,[m
[32m+[m[32m              MaterialPageRoute(builder: (context) => DetailTransaksiView()),[m
[32m+[m[32m            );[m
[32m+[m[32m          },[m
[32m+[m[32m          child: Padding([m
[32m+[m[32m            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),[m
[32m+[m[32m            child: Container([m
[32m+[m[32m              padding: const EdgeInsets.only(left: 5, right: 5),[m
[32m+[m[32m              child: Column([m
[32m+[m[32m                children: [[m
[32m+[m[32m                  Row([m
[32m+[m[32m                    children: [[m
[32m+[m[32m                      Expanded([m
[32m+[m[32m                        child: Container([m
[32m+[m[32m                            color: Colors.white,[m
[32m+[m[32m                            child: Row([m
[32m+[m[32m                              children: [[m
[32m+[m[32m                                Expanded([m
[32m+[m[32m                                  child: Container([m
[32m+[m[32m                                      color: Colors.white,[m
[32m+[m[32m                                      child: Container([m
[32m+[m[32m                                        child: Column([m
[32m+[m[32m                                          mainAxisSize: MainAxisSize.min,[m
[32m+[m[32m                                          crossAxisAlignment:[m
[32m+[m[32m                                              CrossAxisAlignment.start,[m
[32m+[m[32m                                          children: [[m
[32m+[m[32m                                            Text([m
[32m+[m[32m                                              "STTP",[m
[32m+[m[32m                                              style: AppTextStyle.defaultTheme([m
[32m+[m[32m                                                      context)[m
[32m+[m[32m                                                  .bodyMedium[m
[32m+[m[32m                                                  ?.copyWith([m
[32m+[m[32m                                                      fontWeight:[m
[32m+[m[32m                                                          FontWeight.bold,[m
[32m+[m[32m                                                      fontSize: 17),[m
[32m+[m[32m                                            ),[m
[32m+[m[32m                                            const SizedBox([m
[32m+[m[32m                                              width: 7,[m
[32m+[m[32m                                            ),[m
[32m+[m[32m                                            Text([m
[32m+[m[32m                                              "No dok : 394342394",[m
[32m+[m[32m                                              style: AppTextStyle.defaultTheme([m
[32m+[m[32m                                                      context)[m
[32m+[m[32m                                                  .bodyMedium[m
[32m+[m[32m                                                  ?.copyWith([m
[32m+[m[32m                                                      fontSize: 15,[m
[32m+[m[32m                                                      color: Colors.blue[800],[m
[32m+[m[32m                                                      fontWeight:[m
[32m+[m[32m                                                          FontWeight.bold),[m
[32m+[m[32m                                            ),[m
[32m+[m[32m                                            const SizedBox([m
[32m+[m[32m                                              height: 8,[m
[32m+[m[32m                                            ),[m
[32m+[m[32m                                          ],[m
[32m+[m[32m                                        ),[m
[32m+[m[32m                                      )),[m
[32m+[m[32m                                ),[m
[32m+[m[32m                                Expanded([m
[32m+[m[32m                                  child: Container([m
[32m+[m[32m                                      child: Container([m
[32m+[m[32m                                    child: Column([m
[32m+[m[32m                                      mainAxisSize: MainAxisSize.min,[m
[32m+[m[32m                                      crossAxisAlignment:[m
[32m+[m[32m                                          CrossAxisAlignment.start,[m
[32m+[m[32m                                      children: [[m
[32m+[m[32m                                        Container([m
[32m+[m[32m                                          padding: const EdgeInsets.only([m
[32m+[m[32m                                            left: 5,[m
[32m+[m[32m                                            right: 5,[m
[32m+[m[32m                                            top: 4,[m
[32m+[m[32m                                            bottom: 4,[m
[32m+[m[32m                                          ),[m
[32m+[m[32m                                          decoration: BoxDecoration([m
[32m+[m[32m                                              borderRadius:[m
[32m+[m[32m                                                  BorderRadius.circular(4),[m
[32m+[m[32m                                              color: Colors.green),[m
[32m+[m[32m                                          child: Text([m
[32m+[m[32m                                            "Sudah diproses",[m
[32m+[m[32m                                            maxLines: 1,[m
[32m+[m[32m                                            overflow: TextOverflow.ellipsis,[m
[32m+[m[32m                                            style: AppTextStyle.defaultTheme([m
[32m+[m[32m                                                    context)[m
[32m+[m[32m                                                .bodyLarge[m
[32m+[m[32m                                                ?.copyWith([m
[32m+[m[32m                                                    fontSize: 12,[m
[32m+[m[32m                                                    color: Colors.white,[m
[32m+[m[32m                                                    fontWeight:[m
[32m+[m[32m                                                        FontWeight.bold),[m
[32m+[m[32m                                          ),[m
[32m+[m[32m                                        )[m
[32m+[m[32m                                      ],[m
[32m+[m[32m                                    ),[m
[32m+[m[32m                                  )),[m
[32m+[m[32m                                ),[m
[32m+[m[32m                              ],[m
[32m+[m[32m                            )),[m
[32m+[m[32m                      )[m
[32m+[m[32m                    ],[m
[32m+[m[32m                  ),[m
[32m+[m[32m                  Row([m
[32m+[m[32m                    children: [[m
[32m+[m[32m                      Expanded([m
[32m+[m[32m                        child: Container([m
[32m+[m[32m                            color: Colors.white,[m
[32m+[m[32m                            child: Row([m
[32m+[m[32m                              children: [[m
[32m+[m[32m                                Expanded([m
[32m+[m[32m                                  child: Container([m
[32m+[m[32m                                      child: Container([m
[32m+[m[32m                                    child: Column([m
[32m+[m[32m                                      mainAxisSize: MainAxisSize.min,[m
[32m+[m[32m                                      crossAxisAlignment:[m
[32m+[m[32m                                          CrossAxisAlignment.start,[m
[32m+[m[32m                                      children: [[m
[32m+[m[32m                                        Text([m
[32m+[m[32m                                          "Pembuat",[m
[32m+[m[32m                                          style: AppTextStyle.defaultTheme([m
[32m+[m[32m                                                  context)[m
[32m+[m[32m                                              .bodySmall[m
[32m+[m[32m                                              ?.copyWith([m
[32m+[m[32m                                                  color: AppColor.black.shade50,[m
[32m+[m[32m                                                  fontWeight: FontWeight.bold),[m
[32m+[m[32m                                        ),[m
[32m+[m[32m                                        Text([m
[32m+[m[32m                                          "Agus Hermawan",[m
[32m+[m[32m                                          style:[m
[32m+[m[32m                                              AppTextStyle.defaultTheme(context)[m
[32m+[m[32m                                                  .bodyMedium[m
[32m+[m[32m                                                  ?.copyWith([m
[32m+[m[32m                                                      color: AppColor.primary,[m
[32m+[m[32m                                                      fontWeight:[m
[32m+[m[32m                                                          FontWeight.bold),[m
[32m+[m[32m                                        )[m
[32m+[m[32m                                      ],[m
[32m+[m[32m                                    ),[m
[32m+[m[32m                                  )),[m
[32m+[m[32m                                ),[m
[32m+[m[32m                                Expanded([m
[32m+[m[32m                                  child: Container([m
[32m+[m[32m                                      child: Container([m
[32m+[m[32m                                    child: Column([m
[32m+[m[32m                                      mainAxisSize: MainAxisSize.min,[m
[32m+[m[32m                                      crossAxisAlignment:[m
[32m+[m[32m                                          CrossAxisAlignment.start,[m
[32m+[m[32m                                      children: [[m
[32m+[m[32m                                        Text([m
[32m+[m[32m                                          "Tanggal/Jam",[m
[32m+[m[32m                                          style: AppTextStyle.defaultTheme([m
[32m+[m[32m                                                  context)[m
[32m+[m[32m                                              .bodySmall[m
[32m+[m[32m                                              ?.copyWith([m
[32m+[m[32m                                                  color: AppColor.black.shade50,[m
[32m+[m[32m                                                  fontWeight: FontWeight.bold),[m
[32m+[m[32m                                        ),[m
[32m+[m[32m                                        Text([m
[32m+[m[32m                                          "17 okt 2020",[m
[32m+[m[32m                                          style:[m
[32m+[m[32m                                              AppTextStyle.defaultTheme(context)[m
[32m+[m[32m                                                  .bodyMedium[m
[32m+[m[32m                                                  ?.copyWith([m
[32m+[m[32m                                                      color: AppColor.primary,[m
[32m+[m[32m                                                      fontWeight:[m
[32m+[m[32m                                                          FontWeight.bold),[m
[32m+[m[32m                                        )[m
[32m+[m[32m                                      ],[m
[32m+[m[32m                                    ),[m
[32m+[m[32m                                  )),[m
[32m+[m[32m                                ),[m
[32m+[m[32m                              ],[m
[32m+[m[32m                            )),[m
[32m+[m[32m                      )[m
[32m+[m[32m                    ],[m
[32m+[m[32m                  ),[m
[32m+[m[32m                ],[m
[32m+[m[32m              ),[m
[32m+[m[32m            ),[m
[32m+[m[32m          ),[m
         ),[m
       ),[m
     );[m
[1mdiff --git a/lib/app/routes/app_pages.dart b/lib/app/routes/app_pages.dart[m
[1mindex 77c097e..a3ce8b4 100644[m
[1m--- a/lib/app/routes/app_pages.dart[m
[1m+++ b/lib/app/routes/app_pages.dart[m
[36m@@ -6,8 +6,12 @@[m [mimport '../modules/dashboard/bindings/dashboard_binding.dart';[m
 import '../modules/dashboard/views/dashboard_view.dart';[m
 import '../modules/detail_transaksi/bindings/detail_transaksi_binding.dart';[m
 import '../modules/detail_transaksi/views/detail_transaksi_view.dart';[m
[32m+[m[32mimport '../modules/gudang/bindings/gudang_binding.dart';[m
[32m+[m[32mimport '../modules/gudang/views/gudang_view.dart';[m
 import '../modules/login/bindings/login_binding.dart';[m
 import '../modules/login/views/login_view.dart';[m
[32m+[m[32mimport '../modules/material/bindings/material_binding.dart';[m
[32m+[m[32mimport '../modules/material/views/material_view.dart';[m
 import '../modules/notifications/bindings/notifications_binding.dart';[m
 import '../modules/notifications/views/notifications_view.dart';[m
 import '../modules/profile/bindings/profile_binding.dart';[m
[36m@@ -76,5 +80,15 @@[m [mclass AppPages {[m
       page: () => DetailTransaksiView(),[m
       binding: DetailTransaksiBinding(),[m
     ),[m
[32m+[m[32m    GetPage([m
[32m+[m[32m      name: _Paths.GUDANG,[m
[32m+[m[32m      page: () => const GudangView(),[m
[32m+[m[32m      binding: GudangBinding(),[m
[32m+[m[32m    ),[m
[32m+[m[32m    GetPage([m
[32m+[m[32m      name: _Paths.MATERIAL,[m
[32m+[m[32m      page: () => const MaterialView(),[m
[32m+[m[32m      binding: MaterialBinding(),[m
[32m+[m[32m    ),[m
   ];[m
 }[m
[1mdiff --git a/lib/app/routes/app_routes.dart b/lib/app/routes/app_routes.dart[m
[1mindex 52dd915..f846b7d 100644[m
[1m--- a/lib/app/routes/app_routes.dart[m
[1m+++ b/lib/app/routes/app_routes.dart[m
[36m@@ -16,6 +16,8 @@[m [mabstract class Routes {[m
   static const TRANSACTIONS = _Paths.TRANSACTIONS;[m
   static const QRCODE = _Paths.QRCODE;[m
   static const DETAIL_TRANSAKSI = _Paths.DETAIL_TRANSAKSI;[m
[32m+[m[32m  static const GUDANG = _Paths.GUDANG;[m
[32m+[m[32m  static const MATERIAL = _Paths.MATERIAL;[m
 }[m
 [m
 abstract class _Paths {[m
[36m@@ -30,4 +32,6 @@[m [mabstract class _Paths {[m
   static const TRANSACTIONS = '/transactions';[m
   static const QRCODE = '/qrcode';[m
   static const DETAIL_TRANSAKSI = '/detail-transaksi';[m
[32m+[m[32m  static const GUDANG = '/gudang';[m
[32m+[m[32m  static const MATERIAL = '/material';[m
 }[m
[1mdiff --git a/lib/app/utils/dio_utils.dart b/lib/app/utils/dio_utils.dart[m
[1mindex 7ffd329..aa03704 100644[m
[1m--- a/lib/app/utils/dio_utils.dart[m
[1m+++ b/lib/app/utils/dio_utils.dart[m
[36m@@ -3,7 +3,7 @@[m [mimport 'package:dio/dio.dart';[m
 class DioClient {[m
   final Dio _dio = Dio([m
     BaseOptions([m
[31m-      baseUrl: 'http://172.17.2.34:8000/api',[m
[32m+[m[32m      baseUrl: 'http://172.17.2.114:8000/api',[m
       connectTimeout: 5000,[m
       receiveTimeout: 3000,[m
       contentType: 'application/json',[m
[1mdiff --git a/lib/app/widgets/app_bar_blue.dart b/lib/app/widgets/app_bar_blue.dart[m
[1mindex 910ba25..3a4bf66 100644[m
[1m--- a/lib/app/widgets/app_bar_blue.dart[m
[1m+++ b/lib/app/widgets/app_bar_blue.dart[m
[36m@@ -1,38 +1,71 @@[m
 import 'package:flutter/material.dart';[m
[31m-[m
[31m-import 'package:flutter/services.dart';[m
[31m-[m
[31m-import '../themes/app_colors.dart';[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/modules/notifications/views/notifications_view.dart';[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/modules/profile/views/profile_view.dart';[m
 [m
 class AppBarBlue extends StatelessWidget implements PreferredSizeWidget {[m
   final AppBar appBar;[m
   final Text title;[m
[32m+[m[32m  final bool profile;[m
[32m+[m[32m  final bool notifications;[m
 [m
[31m-  const AppBarBlue({Key? key, required this.appBar, required this.title})[m
[32m+[m[32m  const AppBarBlue([m
[32m+[m[32m      {Key? key,[m
[32m+[m[32m      required this.appBar,[m
[32m+[m[32m      required this.title,[m
[32m+[m[32m      required this.profile,[m
[32m+[m[32m      required this.notifications})[m
       : super(key: key);[m
 [m
   @override[m
   Widget build(BuildContext context) {[m
     return AppBar([m
[31m-      systemOverlayStyle: SystemUiOverlayStyle([m
[31m-        statusBarColor: AppColor.primary,[m
[31m-        statusBarIconBrightness: Brightness.light,[m
[31m-        statusBarBrightness: Brightness.light,[m
[32m+[m[32m      leading: Builder([m
[32m+[m[32m        builder: (BuildContext context) {[m
[32m+[m[32m          return notifications[m
[32m+[m[32m              ? IconButton([m
[32m+[m[32m                  icon: const Icon([m
[32m+[m[32m                    Icons.notifications,[m
[32m+[m[32m                    color: Colors.white,[m
[32m+[m[32m                    size: 25,[m
[32m+[m[32m                  ),[m
[32m+[m[32m                  onPressed: () {[m
[32m+[m[32m                    Navigator.push([m
[32m+[m[32m                      context,[m
[32m+[m[32m                      MaterialPageRoute([m
[32m+[m[32m                          builder: (context) => const NotificationsView()),[m
[32m+[m[32m                    );[m
[32m+[m[32m                  },[m
[32m+[m[32m                  tooltip:[m
[32m+[m[32m                      MaterialLocalizations.of(context).openAppDrawerTooltip,[m
[32m+[m[32m                )[m
[32m+[m[32m              : const SizedBox.shrink();[m
[32m+[m[32m        },[m
       ),[m
       elevation: 0,[m
       centerTitle: true,[m
[31m-      backgroundColor: AppColor.primary,[m
[31m-      // leading: IconButton([m
[31m-      //   onPressed: () {[m
[31m-      //     Navigator.pushNamed(context, '/home');[m
[31m-      //   },[m
[31m-      //   icon: const Icon(EvaIcons.arrowBack),[m
[31m-      // ),[m
[32m+[m[32m      backgroundColor: Colors.blue[800],[m
       title: title,[m
       titleTextStyle: const TextStyle([m
[31m-        fontSize: 17,[m
[32m+[m[32m        fontSize: 18,[m
         color: Colors.white,[m
       ),[m
[32m+[m[32m      actions: <Widget>[[m
[32m+[m[32m        profile[m
[32m+[m[32m            ? IconButton([m
[32m+[m[32m                icon: const Icon([m
[32m+[m[32m                  Icons.person,[m
[32m+[m[32m                  color: Colors.white,[m
[32m+[m[32m                  size: 27,[m
[32m+[m[32m                ),[m
[32m+[m[32m                onPressed: () {[m
[32m+[m[32m                  Navigator.push([m
[32m+[m[32m                    context,[m
[32m+[m[32m                    MaterialPageRoute(builder: (context) => ProfileView()),[m
[32m+[m[32m                  );[m
[32m+[m[32m                },[m
[32m+[m[32m              )[m
[32m+[m[32m            : const SizedBox.shrink()[m
[32m+[m[32m      ],[m
     );[m
   }[m
 [m
[1mdiff --git a/lib/app/widgets/app_bar_inka.dart b/lib/app/widgets/app_bar_inka.dart[m
[1mindex 202ca3a..fda8e93 100644[m
[1m--- a/lib/app/widgets/app_bar_inka.dart[m
[1m+++ b/lib/app/widgets/app_bar_inka.dart[m
[36m@@ -1,19 +1,44 @@[m
 import 'package:flutter/material.dart';[m
[31m-import 'package:flutter/services.dart';[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/modules/notifications/views/notifications_view.dart';[m
[32m+[m[32mimport 'package:inka_smart_inventory_mobile/app/modules/profile/views/profile_view.dart';[m
 import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';[m
 import 'package:inka_smart_inventory_mobile/app/utils/assets_util.dart';[m
 [m
 class AppBarInka extends StatelessWidget implements PreferredSizeWidget {[m
   final AppBar appBar;[m
[31m-  const AppBarInka({Key? key, required this.appBar}) : super(key: key);[m
[32m+[m[32m  final bool profile;[m
[32m+[m[32m  final bool notifications;[m
[32m+[m[32m  const AppBarInka([m
[32m+[m[32m      {Key? key,[m
[32m+[m[32m      required this.appBar,[m
[32m+[m[32m      required this.profile,[m
[32m+[m[32m      required this.notifications})[m
[32m+[m[32m      : super(key: key);[m
 [m
   @override[m
   Widget build(BuildContext context) {[m
     return AppBar([m
[31m-      systemOverlayStyle: const SystemUiOverlayStyle([m
[31m-        statusBarColor: Colors.white,[m
[31m-        statusBarIconBrightness: Brightness.dark,[m
[31m-        statusBarBrightness: Brightness.dark,[m
[32m+[m[32m      leading: Builder([m
[32m+[m[32m        builder: (BuildContext context) {[m
[32m+[m[32m          return notifications[m
[32m+[m[32m              ? IconButton([m
[32m+[m[32m                  icon: const Icon([m
[32m+[m[32m                    Icons.notifications,[m
[32m+[m[32m                    color: Colors.black,[m
[32m+[m[32m                    size: 25,[m
[32m+[m[32m                  ),[m
[32m+[m[32m                  onPressed: () {[m
[32m+[m[32m                    Navigator.push([m
[32m+[m[32m                      context,[m
[32m+[m[32m                      MaterialPageRoute([m
[32m+[m[32m                          builder: (context) => const NotificationsView()),[m
[32m+[m[32m                    );[m
[32m+[m[32m                  },[m
[32m+[m[32m                  tooltip:[m
[32m+[m[32m                      MaterialLocalizations.of(context).openAppDrawerTooltip,[m
[32m+[m[32m                )[m
[32m+[m[32m              : const SizedBox.shrink();[m
[32m+[m[32m        },[m
       ),[m
       centerTitle: true,[m
       title: Column([m
[36m@@ -35,6 +60,23 @@[m [mclass AppBarInka extends StatelessWidget implements PreferredSizeWidget {[m
       ),[m
       elevation: 0,[m
       backgroundColor: Colors.white,[m
[32m+[m[32m      actions: <Widget>[[m
[32m+[m[32m        profile[m
[32m+[m[32m            ? IconButton([m
[32m+[m[32m                icon: const Icon([m
[32m+[m[32m                  Icons.person,[m
[32m+[m[32m                  color: Colors.black,[m
[32m+[m[32m                  size: 27,[m
[32m+[m[32m                ),[m
[32m+[m[32m                onPressed: () {[m
[32m+[m[32m                  Navigator.push([m
[32m+[m[32m                    context,[m
[32m+[m[32m                    MaterialPageRoute(builder: (context) => ProfileView()),[m
[32m+[m[32m                  );[m
[32m+[m[32m                },[m
[32m+[m[32m              )[m
[32m+[m[32m            : const SizedBox.shrink()[m
[32m+[m[32m      ],[m
     );[m
   }[m
 [m
[1mdiff --git a/lib/app/widgets/custom_snackbar.dart b/lib/app/widgets/custom_snackbar.dart[m
[1mindex 1de6cb1..7f4bd45 100644[m
[1m--- a/lib/app/widgets/custom_snackbar.dart[m
[1m+++ b/lib/app/widgets/custom_snackbar.dart[m
[36m@@ -1,5 +1,3 @@[m
[31m-import 'dart:ui';[m
[31m-[m
 import 'package:flutter/cupertino.dart';[m
 import 'package:flutter/material.dart';[m
 import 'package:get/get.dart';[m
