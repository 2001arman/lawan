import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/forgot-password/forgot_password_logic.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordLogic());
  }
}
