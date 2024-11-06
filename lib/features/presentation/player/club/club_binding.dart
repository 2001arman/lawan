import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/club/club_logic.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClubLogic());
  }
}
