import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_topup/ads_topup_logic.dart';

class AdsTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdsTopupLogic());
  }
}
