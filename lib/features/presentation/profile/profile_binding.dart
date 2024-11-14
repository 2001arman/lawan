import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/profile_logic.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLogic());
  }
}
