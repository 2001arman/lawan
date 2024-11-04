import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_controller.dart';
import 'package:lawan/features/presentation/lobby/controller/lobby_state.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup-ranked/lineup_ranked_state.dart';

import '../../../../../utility/shared/constants/action_type.dart';
import '../../../../../utility/util/dialogs/custom_dialog_success.dart';
import '../../../../../utility/util/helper.dart';
import '../../../../domain/session/avatar_model.dart';

class LineupRankedLogic extends GetxController {
  LobbyState lobbyState = Get.find<LobbyController>().state;
  LineupRankedState state = LineupRankedState();

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

  void handleSelectedIndexLineUp(int index) {
    if (state.homeLineUp[index] != null) {
      return;
    }
    if (index == lobbyState.selectedIndexLineUp.value) {
      lobbyState.selectedIndexLineUp.value = -1;
    } else {
      lobbyState.selectedIndexLineUp.value = index;
    }
  }
}
