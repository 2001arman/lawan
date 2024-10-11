import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
