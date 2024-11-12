import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:lawan/core/app_route.dart';
import 'package:lawan/features/presentation/admin/admin_main_binding.dart';
import 'package:lawan/firebase_options.dart';

import 'core/depedency_injectore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final ImagePickerPlatform imagePickerImplementation =
      ImagePickerPlatform.instance;
  if (imagePickerImplementation is ImagePickerAndroid) {
    imagePickerImplementation.useAndroidPhotoPicker = true;
  }
  await DependencyInjection.init();

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
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => child,
              ),
            ],
          ],
        );
      },
    );
  }
}
