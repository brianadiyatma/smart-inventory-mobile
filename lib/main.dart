import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

import 'app/themes/app_colors.dart';

import 'package:get_storage/get_storage.dart';

import 'package:flutter/services.dart';

void main() async {
  await GetStorage.init();

  initializeDateFormatting('id_ID', null).then((_) => runApp(
        const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: "INKA Smart Inventory",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColor.createMaterialColor(AppColor.primary),
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              fontSizeFactor: 1,
              bodyColor: AppColor.black.shade200,
              displayColor: AppColor.black.shade300,
            )
            .copyWith(
              button: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.white),
            ),
      ),
    );
  }
}
