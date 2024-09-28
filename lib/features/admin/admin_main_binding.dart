import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_logic.dart';

class AdminMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminMainLogic());
  }
}
