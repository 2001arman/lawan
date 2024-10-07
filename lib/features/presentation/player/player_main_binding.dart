import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:lawan/features/presentation/player/player_main_logic.dart';

class PlayerMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerMainLogic());
  }
}
