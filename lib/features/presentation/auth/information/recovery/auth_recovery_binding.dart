import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_logic.dart';

class AuthRecoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRecoveryLogic());
  }
}
