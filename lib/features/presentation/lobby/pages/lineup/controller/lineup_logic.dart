import 'package:flutter/material.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup/controller/lineup_state.dart';

class LineupLogic {
  LineupState state = LineupState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Hour':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Rate':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }
}
