import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lobby_controller.dart';
import 'package:lawan/features/presentation/lobby/lobby_state.dart';
import 'package:lawan/features/presentation/lobby/lineup-friendly/lineup_friendly_state.dart';

import '../../../../utility/shared/constants/action_type.dart';
import '../../../../utility/util/dialogs/custom_dialog_success.dart';
import '../../../../utility/util/helper.dart';
import '../../../domain/session/avatar_model.dart';

class LineupFriendlyLogic {
  LobbyState lobbyState = Get.find<LobbyController>().state;
  LineupFriendlyState state = LineupFriendlyState();

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
    lobbyState.selectedPlayerIndex.value = -1;
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

  void handleSelectedPlayerIndex(int index) {
    if (lobbyState.selectedPlayerIndex.value == index) {
      lobbyState.selectedPlayerIndex.value = -1;
      lobbyState.selectedAction.value = null;
    } else {
      lobbyState.selectedPlayerIndex.value = index;
    }
  }
}
