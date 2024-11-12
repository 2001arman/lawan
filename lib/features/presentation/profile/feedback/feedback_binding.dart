import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/feedback/feedback_logic.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackLogic());
  }
}
