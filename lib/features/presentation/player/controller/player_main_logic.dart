import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/features/presentation/player/controller/player_main_state.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../../infrastructure/arena/arena_data_source.dart';
import '../ui/player_add_session.dart';

class PlayerMainLogic {
  PlayerMainState state = PlayerMainState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

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

  void onSelectedArena(int arenaIndex, int courtInted) {
    state.selectedArenaIndex.value = arenaIndex;
    state.selectedCourtIndex.value = courtInted;
  }

  void handleNextButton() {
    if (state.selectedIndex.value == 3 || state.selectedIndex.value == 2) {
      if (state.selectedArenaIndex.value == -1) {
        return Helper.showToast(
          isSuccess: false,
          message: "Please choose arena first!",
        );
      }
    }
    if (state.selectedIndex.value == 3) {
      ArenaModel arenaModel =
          arenaDataSource.listArena[state.selectedArenaIndex.value];
      SessionModel sessionModel = SessionModel(
        arena: arenaModel,
        selectedCourt: state.selectedCourtIndex.value,
        dateTime: state.selectedDate,
        startHour: state.openTime.value,
        endHour: state.closeTime.value,
        totalHour: state.selectedHour.value,
        firstName: 'Ali',
        lastName: 'Qazwini',
        contactNumber: '',
        identificationNumber: '',
        price: 20,
      );
      Get.log('cek session model ${sessionModel.dateTime}');
      Get.toNamed(
        CheckoutUi.namePath,
        arguments: [sessionModel, state],
      );
      return;
    }

    state.selectedIndex.value++;
  }

  void showCreateDialog() => PlayerAddSession(
        logic: this,
        state: state,
      ).createNewSession();

  PageController setController(PageController controller) =>
      state.pageController = controller;
}
