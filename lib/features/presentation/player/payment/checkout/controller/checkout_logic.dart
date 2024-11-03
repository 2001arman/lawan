import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';

import '../../../../../domain/session/session_model.dart';
import '../../../../admin/pages/session/admin_add_session.dart';
import '../../../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../../../admin/pages/session/session_logic.dart';
import '../../../create-session/player_add_session_logic.dart';

class CheckoutLogic extends GetxController {
  late SessionModel sessionModel;

  @override
  void onInit() {
    sessionModel = Get.arguments[0];
    super.onInit();
  }

  void onCreateSession() async {
    SessionModel sessionModel = Get.arguments[0];
    Function(SessionModel session) sessionLogic = Get.arguments[1];
    SessionType sessionType = Get.arguments[2];

    final friendSessionLogic = Get.find<PlayerAddSessionLogic>();
    friendSessionLogic.resetState();

    sessionLogic(sessionModel);
    Get.close(2);
    await Future.delayed(const Duration(seconds: 1));
    AdminSessionBottomSheet().successCreateSesssionSheet(
      sessionType: sessionType,
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
