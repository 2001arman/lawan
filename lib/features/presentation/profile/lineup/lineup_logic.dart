import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/lineup/lineup_state.dart';

class LineupLogic extends GetxController {
  LineupState state = LineupState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Home':
        state.lineUpActiveAlignment.value = Alignment.centerLeft;
        break;
      case 'Away':
        state.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      default:
        state.lineUpActiveAlignment.value = Alignment.center;
        break;
    }
  }
}
