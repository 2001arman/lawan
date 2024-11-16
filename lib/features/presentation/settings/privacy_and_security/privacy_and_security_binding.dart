import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/privacy_and_security/privacy_and_security_logic.dart';

class PrivacyAndSecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyAndSecurityLogic());
  }
}
