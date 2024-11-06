import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardState {
  var lobbyActiveAlignment = Alignment.centerLeft.obs;
  var lobbyTabActive = 'Player'.obs;
  List<String> lobbyTabBarTitle = [
    'Player',
    'Club',
  ];
  List<String> lobbyTabBarIcon = [
    'assets/icons/user.svg',
    'assets/icons/club.svg',
  ];
  RxBool activeScroll = false.obs;

  var showWidget = true.obs;

  var showStarMode = true.obs;
}
