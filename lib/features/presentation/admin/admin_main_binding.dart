import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_logic.dart';
import 'package:lawan/features/presentation/admin/arena/controller/admin_arena_logic.dart';
import 'package:lawan/features/presentation/admin/sales/sales_logic.dart';
import 'package:lawan/features/presentation/admin/session/session_logic.dart';
import 'package:lawan/features/infrastructure/arena/arena_data_source.dart';

class AdminMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminMainLogic());
    Get.lazyPut(() => ArenaDataSource(), fenix: true);

    Get.lazyPut(() => AdminArenaLogic(), fenix: true);
    Get.lazyPut(() => SessionLogic(), fenix: true);
    Get.lazyPut(() => SalesLogic());
  }
}
