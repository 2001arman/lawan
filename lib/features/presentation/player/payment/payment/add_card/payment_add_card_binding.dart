import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/add_card/payment_add_card_logic.dart';

class PaymentAddCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentAddCardLogic());
  }
}
