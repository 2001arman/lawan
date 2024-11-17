import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_choose/ads_choose_logic.dart';

class AdsChooseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdsChooseLogic());
  }
}
