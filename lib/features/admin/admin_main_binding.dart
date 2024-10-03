import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_logic.dart';
import 'package:lawan/features/admin/session/session_logic.dart';
import 'package:lawan/features/infrastructure/arena/arena_data_source.dart';

class AdminMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminMainLogic());
    Get.lazyPut(() => ArenaDataSource());
    Get.lazyPut(() => SessionLogic());
  }
}
