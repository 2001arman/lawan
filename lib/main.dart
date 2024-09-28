import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/core/app_route.dart';
import 'package:lawan/features/admin/admin_main_binding.dart';
import 'package:lawan/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
    );
  }
}
