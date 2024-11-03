import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';

import 'lobby_state.dart';

class LobbyController extends GetxController {
  LobbyState state = LobbyState();
  late SessionType sessionType;

  @override
  void onInit() {
    super.onInit();
    sessionType = Get.arguments[0];
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
