import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/player_main_state.dart';

import '../../infrastructure/arena/arena_data_source.dart';

class PlayerMainLogic {
  PlayerMainState state = PlayerMainState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Public':
        state.activeAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.activeAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  void handleNextButton() {
    if (state.selectedIndex.value == 3) {
      Get.back();
      return;
    }
    state.selectedIndex.value++;
  }

  PageController setController(PageController controller) =>
      state.pageController = controller;
}
