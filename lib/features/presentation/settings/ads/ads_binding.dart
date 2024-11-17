import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_logic.dart';

class AdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdsLogic());
  }
}
