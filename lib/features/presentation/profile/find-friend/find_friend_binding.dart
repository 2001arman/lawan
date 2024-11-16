import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/find-friend/find_friend_logic.dart';

class FindFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindFriendLogic());
  }
}
