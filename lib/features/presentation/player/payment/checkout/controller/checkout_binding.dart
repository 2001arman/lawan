import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_logic.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutLogic());
  }
}
