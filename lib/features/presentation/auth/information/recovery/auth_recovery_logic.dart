import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_state.dart';

class AuthRecoveryLogic extends GetxController {
  AuthRecoveryState state = AuthRecoveryState();

  void nextIndex() {
    if (state.stepIndex.value == 6) {
      Get.offAllNamed(AdminMainUi.namePath);
      return;
    }
    state.stepIndex++;
  }

  void previousIndex() {
    if (state.stepIndex.value == 0) {
      return Get.back();
    }
    state.stepIndex--;
  }
}
