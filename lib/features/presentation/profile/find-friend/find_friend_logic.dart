import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/find-friend/find_friend_state.dart';

class FindFriendLogic extends GetxController {
  FindFriendState state = FindFriendState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Facebook':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Contact':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }
}
