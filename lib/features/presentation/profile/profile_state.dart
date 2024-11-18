import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileState {
  var lobbyActiveAlignment = Alignment.centerLeft.obs;
  var lobbyTabActive = 'Sessions'.obs;
  List<String> lobbyTabBarTitle = [
    'Sessions',
    'Statistics',
  ];

  RxBool isFavorite = true.obs;
}
