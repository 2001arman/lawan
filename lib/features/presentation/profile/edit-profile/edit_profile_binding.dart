import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/edit-profile/edit_profile_logic.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileLogic());
  }
}
