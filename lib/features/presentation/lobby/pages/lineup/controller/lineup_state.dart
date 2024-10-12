import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineupState {
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Details'.obs;
  List<String> tabBarTitle = [
    'Details',
    'Hour',
    'Rate',
  ];
}
