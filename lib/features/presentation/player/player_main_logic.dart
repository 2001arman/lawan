import 'package:flutter/material.dart';
import 'package:lawan/features/presentation/player/player_main_state.dart';

class PlayerMainLogic {
  PlayerMainState state = PlayerMainState();

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
}
