import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:lawan/core/app_route.dart';
import 'package:lawan/features/admin/admin_main_binding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Lufga',
        ),
        navigatorKey: Get.key,
        getPages: AppRoute.routes,
        initialRoute: AppRoute.initialRoute,
        initialBinding: AdminMainBinding(),
        // builder: (context, child) {
        //   child = EasyLoading.init()(context, child);
        //   return MediaQuery(data: MediaQuery.of(context), child: child);
        // },
      ),
    );
  }
}
