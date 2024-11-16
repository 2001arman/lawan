import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/balance/balance_logic.dart';

class BalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalanceLogic());
  }
}
