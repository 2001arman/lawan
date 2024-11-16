import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_logic.dart';

class PersonalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDetailsLogic());
  }
}
