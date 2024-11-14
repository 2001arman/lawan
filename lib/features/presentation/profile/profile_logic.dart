import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/profile_state.dart';

class ProfileLogic extends GetxController {
  ProfileState state = ProfileState();

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Sessions':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }
}
