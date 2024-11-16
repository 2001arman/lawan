import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/settings_logic.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsLogic());
  }
}
