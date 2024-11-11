import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/player_main_state.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_logic.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_state.dart';
import 'package:lawan/features/presentation/player/leaderboard/leaderboard_logic.dart';
import 'package:lawan/features/presentation/player/ranked/ranked_main_logic.dart';

class PlayerMainLogic extends GetxController {
  final state = Get.find<PlayerMainState>();
  FriendlyMainLogic friendlyMainLogic = Get.find<FriendlyMainLogic>();
  FriendlyMainState friendlyMainState = Get.find<FriendlyMainLogic>().state;
  RankedMainLogic rankedlyMainLogic = Get.find<RankedMainLogic>();
  LeaderboardLogic leaderboardLogic = Get.find<LeaderboardLogic>();

  void changeIndex(int index) {
    state.selectedNavbarIndex.value = index;
    if (index == 0) {
      friendlyMainLogic.initVideo();
      rankedlyMainLogic.disposeVideo();
    } else if (index == 1) {
      rankedlyMainLogic.initVideo();
      friendlyMainLogic.disposeVideo();
    } else {
      friendlyMainLogic.disposeVideo();
      rankedlyMainLogic.disposeVideo();
    }
  }
}
