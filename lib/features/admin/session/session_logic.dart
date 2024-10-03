import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/admin/admin_main_state.dart';
import 'package:lawan/features/admin/session/admin_add_session.dart';
import 'package:lawan/features/admin/session/admin_session_bottom_sheet.dart';
import 'package:lawan/features/admin/session/session_state.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/utility/util/custom_dialog_success.dart';

import '../../infrastructure/arena/arena_data_source.dart';

class SessionLogic extends GetxController {
  SessionState state = SessionState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  @override
  void onInit() {
    state.listSession[1].sessionsData.add(
      SessionModel(
        arena: arenaDataSource.listArena.first,
        selectedCourt: 0,
        dateTime: DateTime.now().add(const Duration(days: 1)),
        startHour: const TimeOfDay(hour: 15, minute: 0),
        endHour: const TimeOfDay(hour: 16, minute: 0),
        totalHour: 1,
        firstName: 'Arman',
        lastName: 'Maulana',
        contactNumber: '32133487',
        identificationNumber: '9831299479',
        price: 20,
      ),
    );
    state.listSession.refresh();
    super.onInit();
  }

  void showDetailSession({required SessionModel sessionData}) {
    AdminSessionBottomSheet().showDetailSessionSheet(sessionData: sessionData);
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
