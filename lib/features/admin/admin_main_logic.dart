import 'package:flutter/material.dart';
import 'package:lawan/features/admin/admin_add_arena.dart';
import 'package:lawan/features/admin/admin_main_state.dart';

class AdminMainLogic {
  AdminMainState state = AdminMainState();

  void createNewArena() {
    AdminAddArena(state: state).createNewArena();
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Details':
        state.activeAlignment.value = Alignment.centerLeft;
        break;
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
