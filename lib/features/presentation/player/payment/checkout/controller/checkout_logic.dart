import 'package:get/get.dart';

import '../../../../../domain/session/session_model.dart';
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

    final friendSessionLogic = Get.find<PlayerAddSessionLogic>();
    friendSessionLogic.resetState();

    sessionLogic(sessionModel);
  }
}
