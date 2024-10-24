import 'package:get/get.dart';

import '../../../../../domain/session/session_model.dart';

class CheckoutLogic extends GetxController {
  late SessionModel sessionModel;

  @override
  void onInit() {
    sessionModel = Get.arguments[0];
    super.onInit();
  }
}
