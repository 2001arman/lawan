import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lobby_state.dart';

class LobbyController extends GetxController {
  LobbyState state = Get.find<LobbyState>();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Hour':
        state.lineUpActiveAlignment.value = Alignment.center;
        break;
      case 'Rate':
        state.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      default:
        state.lineUpActiveAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Line-Up':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }
}
