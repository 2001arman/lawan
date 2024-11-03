import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_controller.dart';
import 'package:lawan/features/presentation/lobby/pages/chat/controller/chat_controller.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup-friendly/lineup_friendly_logic.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup-ranked/lineup_ranked_logic.dart';

class LobbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LobbyController());
    Get.lazyPut(() => LineupFriendlyLogic());
    Get.lazyPut(() => LineupRankedLogic());
    Get.lazyPut(() => ChatController());
  }
}
