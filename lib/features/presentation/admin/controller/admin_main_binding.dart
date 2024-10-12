import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/controller/admin_main_logic.dart';
import 'package:lawan/features/presentation/admin/pages/arena/controller/admin_arena_logic.dart';
import 'package:lawan/features/presentation/admin/pages/sales/sales_logic.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_logic.dart';
import 'package:lawan/features/infrastructure/arena/arena_data_source.dart';

class AdminMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminMainLogic());
    Get.lazyPut(() => ArenaDataSource());

    Get.lazyPut(() => AdminArenaLogic());
    Get.lazyPut(() => SessionLogic());
    Get.lazyPut(() => SalesLogic());
  }
}
