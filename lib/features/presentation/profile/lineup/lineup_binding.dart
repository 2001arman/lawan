import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/lineup/lineup_logic.dart';

class LineupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LineupLogic());
  }
}
