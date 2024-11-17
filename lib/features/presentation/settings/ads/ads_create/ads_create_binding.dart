import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_logic.dart';

class AdsCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdsCreateLogic());
  }
}
