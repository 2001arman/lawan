import 'package:get/get.dart';
import 'package:lawan/features/infrastructure/arena/arena_data_source.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_logic.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutLogic());
    Get.lazyPut(() => ArenaDataSource());
  }
}
