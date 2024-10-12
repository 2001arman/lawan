import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_state.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup/controller/lineup_state.dart';

class LineupLogic {
  LobbyState lobbyState = Get.find<LobbyState>();
  LineupState state = LineupState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Home':
        lobbyState.lineUpActiveAlignment.value = Alignment.centerLeft;
        break;
      case 'Away':
        lobbyState.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      default:
        lobbyState.lineUpActiveAlignment.value = Alignment.center;
        break;
    }
    return;
  }
}
