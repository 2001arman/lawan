import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_logic.dart';

class AuthInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthInformationLogic());
  }
}
