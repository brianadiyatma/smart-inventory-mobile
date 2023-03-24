import 'package:get/get.dart';

import '../modules/bottom_navigator/bindings/bottom_navigator_binding.dart';
import '../modules/bottom_navigator/views/bottom_navigator_view.dart';
import '../modules/bpm/detail_transaksi_bpm/bindings/detail_transaksi_bpm_binding.dart';
import '../modules/bpm/detail_transaksi_bpm/views/detail_transaksi_bpm_view.dart';
import '../modules/bpm/informasi_detail_bpm/bindings/informasi_detail_bpm_binding.dart';
import '../modules/bpm/informasi_detail_bpm/views/informasi_detail_bpm_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboardv2/bindings/dashboardv2_binding.dart';
import '../modules/dashboardv2/views/dashboardv2_view.dart';
import '../modules/documenttype/bindings/documenttype_binding.dart';
import '../modules/documenttype/views/documenttype_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/gudang/detail_gudang/bindings/detail_gudang_binding.dart';
import '../modules/gudang/detail_gudang/views/detail_gudang_view.dart';
import '../modules/gudang/gudang_view/bindings/gudang_binding.dart';
import '../modules/gudang/gudang_view/views/gudang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/material/detail_material/bindings/detail_material_binding.dart';
import '../modules/material/detail_material/views/detail_material_view.dart';
import '../modules/material/material_view/bindings/material_binding.dart';
import '../modules/material/material_view/views/material_view.dart';
import '../modules/my_transactions/bindings/my_transactions_binding.dart';
import '../modules/my_transactions/views/my_transactions_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/qr_helper/bindings/qr_helper_binding.dart';
import '../modules/qr_helper/views/qr_helper_view.dart';
import '../modules/qrcode/bindings/qrcode_binding.dart';
import '../modules/qrcode/views/qrcode_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/sttp/detail_transaksi_sttp/bindings/detail_transaksi_sttp_binding.dart';
import '../modules/sttp/detail_transaksi_sttp/views/detail_transaksi_sttp_view.dart';
import '../modules/sttp/informasi_detail_sttp/bindings/informasi_detail_sttp_binding.dart';
import '../modules/sttp/informasi_detail_sttp/views/informasi_detail_sttp_view.dart';
import '../modules/transactions/bindings/transactions_binding.dart';
import '../modules/transactions/views/transactions_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;
  static const LOGIN = Routes.LOGIN;
  static const BOTTOM_NAVIGATOR = Routes.BOTTOM_NAVIGATOR;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashScreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATOR,
      page: () => BottomNavigatorView(),
      binding: BottomNavigatorBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => const TransactionsView(),
      binding: TransactionsBinding(),
    ),
    GetPage(
      name: _Paths.QRCODE,
      page: () => QrcodeView(),
      binding: QrcodeBinding(),
    ),
    GetPage(
      name: _Paths.GUDANG,
      page: () => const GudangView(),
      binding: GudangBinding(),
    ),
    GetPage(
      name: _Paths.MATERIAL,
      page: () => MaterialView(),
      binding: MaterialBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_DETAIL_STTP,
      page: () => InformasiDetailSttpView(),
      binding: InformasiDetailSttpBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_DETAIL_BPM,
      page: () => InformasiDetailBpmView(),
      binding: InformasiDetailBpmBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_GUDANG,
      page: () => const DetailGudangView(),
      binding: DetailGudangBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI_BPM,
      page: () => const DetailTransaksiBpmView(),
      binding: DetailTransaksiBpmBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MATERIAL,
      page: () => const DetailMaterialView(),
      binding: DetailMaterialBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI_STTP,
      page: () => const DetailTransaksiSttpView(),
      binding: DetailTransaksiSttpBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARDV2,
      page: () => Dashboardv2View(),
      binding: Dashboardv2Binding(),
    ),
    GetPage(
      name: _Paths.QR_HELPER,
      page: () => const QrHelperView(),
      binding: QrHelperBinding(),
      children: [
        GetPage(
          name: _Paths.QR_HELPER,
          page: () => const QrHelperView(),
          binding: QrHelperBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MY_TRANSACTIONS,
      page: () => const MyTransactionsView(),
      binding: MyTransactionsBinding(),
    ),
    GetPage(
        name: _Paths.FORGOT_PASSWORD,
        page: (() => const ForgotPasswordView()),
        binding: ForgotPasswordBinding()),
    GetPage(
      name: _Paths.DOCUMENTTYPE,
      page: () => const DocumenttypeView(),
      binding: DocumenttypeBinding(),
    ),
  ];
}
