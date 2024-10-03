import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_state.dart';
import 'package:lawan/features/admin/session/admin_add_session.dart';
import 'package:lawan/features/admin/session/admin_session_bottom_sheet.dart';
import 'package:lawan/features/admin/session/session_state.dart';
import 'package:lawan/utility/util/custom_dialog_success.dart';

import '../../infrastructure/arena/arena_data_source.dart';

class SessionLogic {
  SessionState state = SessionState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  void showDetailArena() {
    AdminSessionBottomSheet().showDetailSessionSheet();
  }

  void showAddArenaBottomSheet() {
    AdminAddSession(state: state, logic: this).createNewArena();
  }

  PageController setController(PageController controller) =>
      state.pageController = controller;

  void handleNextButton() async {
    if (state.selectedIndex.value == 3) {
      Get.back();
      CustomDialogSuccess.confirmDialog(
        actionType: ActionType.booking,
        onAction: () {
          Get.back();
          AdminSessionBottomSheet().successCreateSesssionSheet(
            arenaModel: arenaDataSource.listArena.first,
          );
        },
      );
      return;
    }
    state.selectedIndex.value++;
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Outdoor':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }
}
