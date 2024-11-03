import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/create-session/player_add_session_state.dart';

import '../../../../utility/util/helper.dart';
import '../../../domain/arena/arena_model.dart';
import '../../../domain/session/avatar_model.dart';
import '../../../domain/session/session_model.dart';
import '../../../infrastructure/arena/arena_data_source.dart';
import '../payment/checkout/ui/checkout_ui.dart';

class PlayerAddSessionLogic {
  final PlayerAddSessionState state = PlayerAddSessionState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  void onSelectedArena(int arenaIndex, int courtInted) {
    state.selectedArenaIndex.value = arenaIndex;
    state.selectedCourtIndex.value = courtInted;
  }

  void handleNextButton({
    required Function(SessionModel session) onCreate,
  }) async {
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

      await Get.toNamed(
        CheckoutUi.namePath,
        arguments: [sessionModel, onCreate],
      );
      return;
    }
    state.selectedIndex.value++;
    return;
  }

  PageController setController(PageController controller) =>
      state.pageController = controller;

  void inviteFriends(AvatarModel data) {
    data.isSelected.value = true;
    state.selectedFriends.add(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User added for invitation successfully',
    );
  }

  void removeInviteFriends(AvatarModel data) {
    data.isSelected.value = false;
    state.selectedFriends.remove(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User removed from card successfully',
    );
  }

  void resetState() {
    state.selectedArenaIndex.value = -1;
    state.selectedCourtIndex.value = 0;
    state.selectedIndex.value = 1;

    state.listFriends.addAll(state.selectedFriends);
    state.selectedFriends.clear();
    state.selectedIndex.value = 1;

    state.selectedArenaIndex = (-1).obs;
    state.selectedCourtIndex = 0.obs;

    state.selectedDate = DateTime.now().add(const Duration(days: 1));
    state.openTime = const TimeOfDay(hour: 9, minute: 00).obs;
    state.closeTime = const TimeOfDay(hour: 10, minute: 00).obs;
  }
}
