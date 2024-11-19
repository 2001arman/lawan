import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/leaderboard/leaderboard_state.dart';

class LeaderboardLogic extends GetxController {
  final LeaderboardState state = LeaderboardState();

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Player':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Gombak':
        state.lineUpActiveAlignment.value = Alignment.centerLeft;
        break;
      case 'Selangor':
        state.lineUpActiveAlignment.value = Alignment.center;
        break;
      case 'Malaysia':
        state.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      case '':
        state.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      default:
        state.lineUpActiveAlignment.value = Alignment.center;
        break;
    }
    return;
  }
}
