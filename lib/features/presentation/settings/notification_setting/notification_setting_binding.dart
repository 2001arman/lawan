import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/notification_setting/notification_setting_logic.dart';

class NotificationSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationSettingLogic());
  }
}
