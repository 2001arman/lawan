import 'package:get/get.dart';

import '../../../../../domain/session/session_model.dart';

class CheckoutLogic extends GetxController {
  late SessionModel sessionModel;

  @override
  void onInit() {
    sessionModel = Get.arguments[0];
    Get.log('cek init ${sessionModel.dateTime}');
    super.onInit();
  }

  @override
  void onClose() {
    Get.log('cek close ');
    super.onClose();
  }
}
