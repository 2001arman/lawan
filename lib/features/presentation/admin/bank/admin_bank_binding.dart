import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_logic.dart';

class AdminBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminBankLogic());
  }
}
