import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_state.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';

import '../../../../../utility/shared/constants/global_variable.dart';

class AuthRecoveryLogic extends GetxController {
  AuthRecoveryState state = AuthRecoveryState();
  final GlobalVariable _globalVariable = Get.find<GlobalVariable>();

  void nextIndex() {
    if (state.stepIndex.value == 6) {
      Get.offAllNamed(PlayerMainUi.namePath);
      _globalVariable.isLogin.value = true;
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

  void image() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      imageQuality: 10,
      source: ImageSource.gallery,
    );
    if (image != null) {
      state.selectedImage.value = image;
      state.selectedImage.refresh();
    }
  }
}
