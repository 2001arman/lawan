import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';

import '../../../../../domain/session/session_model.dart';
import '../../../../admin/pages/session/admin_add_session.dart';
import '../../../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../../../admin/pages/session/session_logic.dart';

class CheckoutLogic extends GetxController {
  late SessionModel sessionModel;

  @override
  void onInit() {
    sessionModel = Get.arguments[0];
    super.onInit();
  }

  void onCreateSession() async {
    SessionModel sessionModel = Get.arguments[0];
    PlayerMainLogic playerMainLogic = Get.arguments[1];

    playerMainLogic.state.sessionList.add(sessionModel);
    playerMainLogic.resetState();

    Get.close(2);
    playerMainLogic.disposeVideo();
    await Future.delayed(const Duration(seconds: 1));
    AdminSessionBottomSheet().successCreateSesssionSheet(
      arenaModel: sessionModel.arena,
      selectedCourt: sessionModel.selectedCourt,
      session: sessionModel,
      showPill: true,
      successCreate: true,
      isAdmin: false,
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
}
