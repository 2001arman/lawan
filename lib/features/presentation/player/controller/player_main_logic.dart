import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/controller/player_main_state.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_logic.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_state.dart';

class PlayerMainLogic extends GetxController {
  PlayerMainState state = PlayerMainState();
  FriendlyMainLogic friendlyMainLogic = Get.find<FriendlyMainLogic>();
  FriendlyMainState friendlyMainState = Get.find<FriendlyMainLogic>().state;
}
