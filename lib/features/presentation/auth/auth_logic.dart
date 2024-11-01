import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_state.dart';

class AuthLogic extends GetxController {
  final state = AuthState();

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Login':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }
}
