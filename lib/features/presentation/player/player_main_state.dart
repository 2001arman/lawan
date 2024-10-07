import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PlayerMainState {
  var selectedNavbarIndex = 0.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Public'.obs;
  List<String> tabBarTitle = [
    'Public',
    'Private',
  ];
}
