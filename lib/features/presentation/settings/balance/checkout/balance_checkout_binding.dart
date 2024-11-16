import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/balance/checkout/balance_checkout_logic.dart';

class BalanceCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalanceCheckoutLogic());
  }
}
