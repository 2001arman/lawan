import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';

import '../../domain/session/session_model.dart';
import '../admin/session/admin_add_session.dart';
import '../admin/session/admin_session_bottom_sheet.dart';
import '../admin/session/session_logic.dart';
import '../player/player_main_state.dart';
import 'lobby_state.dart';

class LobbyController extends GetxController {
  LobbyState state = LobbyState();
  late SessionType sessionType;
  late SessionModel sessionModel;

  @override
  void onInit() {
    super.onInit();
    sessionType = Get.arguments[0];
    Get.log('cek session Type $sessionType');
    sessionModel = Get.arguments[1];
    state.isReferee = Get.arguments[2];
  }

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Line-Up':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  void onCreate(SessionModel session) async {
    Get.close(3);
    await Future.delayed(const Duration(seconds: 1));
    AdminSessionBottomSheet().successCreateSesssionSheet(
      sessionType: SessionType.ranked,
      arenaModel: session.arena,
      selectedCourt: session.selectedCourt,
      session: session,
      showPill: true,
      successCreate: true,
      isAdmin: false,
      title: 'You have joined the session',
      onUpdate: () {
        Get.back();
        AdminAddSession(
          state: Get.find<SessionLogic>().state,
          logic: Get.find<SessionLogic>(),
        ).createNewSession();
      },
      onDelete: () {},
    );
  }

  Future<void> handleSlideLogic() async {
    if (sessionType == SessionType.ranked && !state.isReferee) {
      if (state.selectedPlayerIndex.value != -1) {
        return Get.toNamed(
          CheckoutUi.namePath,
          arguments: [sessionModel, onCreate],
        );
      }
    } else {
      state.isStarting.value = true;
    }
  }

  Future<void> handleSlideAction() async {
    state.selectedAction.value = null;
    state.selectedPlayerIndex.value = -1;
  }

  void handleSelectedAction(NavbarItem navbarItem) {
    // if (state.selectedPlayerIndex.value == -1) return;
    state.selectedAction.value = navbarItem;
  }
}
