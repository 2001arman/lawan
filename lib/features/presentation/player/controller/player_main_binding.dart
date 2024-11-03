import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';
import 'package:lawan/features/presentation/player/create-session/player_add_session_logic.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_logic.dart';

class PlayerMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerMainLogic());
    Get.lazyPut(() => FriendlyMainLogic());
    Get.lazyPut(() => PlayerAddSessionLogic());
  }
}
