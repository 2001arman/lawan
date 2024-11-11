import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lobby_controller.dart';
import 'package:lawan/features/presentation/lobby/lobby_state.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/lineup_ranked_state.dart';

import '../../../../utility/shared/constants/action_type.dart';
import '../../../../utility/util/dialogs/custom_dialog_success.dart';
import '../../../../utility/util/helper.dart';
import '../../../domain/session/avatar_model.dart';

class LineupRankedLogic extends GetxController {
  LobbyState lobbyState = Get.find<LobbyController>().state;
  LineupRankedState state = LineupRankedState();

  @override
  void onInit() {
    setAllPlayer();
    super.onInit();
  }

  void setAllPlayer() {
    if (lobbyState.isReferee) {
      for (int i = 0; i < state.homeLineUp.length; i++) {
        // If the current item is null, set it to the default avatar
        state.homeLineUp[i] ??= state.avatar;
        state.awayLineUp[i] ??= state.avatar;
      }
      state.homeLineUp.refresh(); // Refresh the observable list
    }
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Home':
        lobbyState.lineUpActiveAlignment.value = Alignment.centerLeft;
        break;
      case 'Away':
        lobbyState.lineUpActiveAlignment.value = Alignment.centerRight;
        break;
      default:
        lobbyState.lineUpActiveAlignment.value = Alignment.center;
        break;
    }
    return;
  }

  void selectReferee({required int index, required String name}) {
    CustomDialogSuccess.confirmDialog(
      actionType: ActionType.assignReferee,
      name: name,
      onAction: () {
        state.selectedRefereeIndex.value = index;
        Get.back();
      },
    );
  }

  void addInviteFriend(AvatarModel data) {
    Helper.showToast(
      isSuccess: true,
      message: 'Invitation sent',
    );
    state.selectedFriends.add(data);
    state.listFriends.remove(data);
    state.availableSlot.value--;
  }

  void handleselectedPlayerIndex(int index) {
    if (!lobbyState.isReferee && state.homeLineUp[index] != null) {
      return;
    }
    if (index == lobbyState.selectedPlayerIndex.value) {
      lobbyState.selectedPlayerIndex.value = -1;
      lobbyState.selectedPlayerIndex.value = -1;
    } else {
      lobbyState.selectedPlayerIndex.value = index;
      lobbyState.selectedPlayerIndex.value = index;
    }
  }

  AvatarModel? getProfilePosition(int index) {
    if (lobbyState.lineUpTabActive.value == 'Home') {
      return state.homeLineUp[index];
    } else if (lobbyState.lineUpTabActive.value == 'Away') {
      return state.awayLineUp[index];
    } else {
      return null;
    }
  }

  void handleSelectedPlayerIndex(int index) {
    if (lobbyState.selectedPlayerIndex.value == index) {
      lobbyState.selectedPlayerIndex.value = -1;
      lobbyState.selectedAction.value = null;
    } else {
      lobbyState.selectedPlayerIndex.value = index;
    }
  }
}
