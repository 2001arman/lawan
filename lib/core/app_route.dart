import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lawan/features/presentation/admin/admin_main_binding.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/player/player_main_binding.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';

class AppRoute {
  static const initialRoute = AdminMainUi.namePath;
  static final routes = [
    GetPage(
      name: AdminMainUi.namePath,
      page: () => AdminMainUi(),
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: PlayerMainUi.namePath,
      page: () => PlayerMainUi(),
      binding: PlayerMainBinding(),
    ),
  ];
}
