import 'package:get/get.dart';

import '../utility/shared/constants/global_variable.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => GlobalVariable().init(), permanent: true);
  }
}
