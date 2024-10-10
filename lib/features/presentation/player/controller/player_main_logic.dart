import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/controller/player_main_state.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';

import '../../../infrastructure/arena/arena_data_source.dart';

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
      Get.toNamed(CheckoutUi.namePath);
      return;
    }
    state.selectedIndex.value++;
  }

  PageController setController(PageController controller) =>
      state.pageController = controller;
}
