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

  @override
  void onReady() {
    super.onReady();
    final RenderBox renderBox =
        state.appBarKey.currentContext?.findRenderObject() as RenderBox;
    Get.log('cek height dong ${renderBox.size.height}');
    state.height.value = renderBox.size.height;
  }
}
