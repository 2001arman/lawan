import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_logic.dart';
import 'package:lawan/features/presentation/player/ranked/ranked_main_logic.dart';
import 'package:lawan/features/presentation/referee/referee_logic.dart';

class RefereeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RefereeLogic());
    Get.lazyPut(() => FriendlyMainLogic());
    Get.lazyPut(() => RankedMainLogic());
  }
}
