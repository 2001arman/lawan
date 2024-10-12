import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_controller.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_state.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup/controller/lineup_logic.dart';

class LobbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LobbyController());
    Get.lazyPut(() => LobbyState());
    Get.lazyPut(() => LineupLogic());
  }
}
