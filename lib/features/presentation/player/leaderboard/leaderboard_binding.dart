import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/leaderboard/leaderboard_logic.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderboardLogic());
  }
}
