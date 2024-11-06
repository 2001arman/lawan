import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_logic.dart';

class CreateClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateClubLogic());
  }
}
