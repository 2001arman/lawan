import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';

import '../../../domain/session/session_model.dart';
import '../../admin/pages/session/admin_add_session.dart';
import '../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../admin/pages/session/session_logic.dart';
import 'lobby_state.dart';

class LobbyController extends GetxController {
  LobbyState state = LobbyState();
  late SessionType sessionType;
  late SessionModel sessionModel;

  @override
  void onInit() {
    super.onInit();
    sessionType = Get.arguments[0];
    sessionModel = Get.arguments[1];
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

  Future<void> handleCheckoutPage() async {
    Get.toNamed(
      CheckoutUi.namePath,
      arguments: [
        sessionModel,
        onCreate,
        sessionType,
      ],
    );
  }
}
