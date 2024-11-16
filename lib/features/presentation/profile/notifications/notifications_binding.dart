import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_logic.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsLogic());
  }
}
