import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LobbyState {
  var lobbyActiveAlignment = Alignment.centerLeft.obs;
  var lobbyTabActive = 'Line-Up'.obs;
  List<String> lobbyTabBarTitle = [
    'Line-Up',
    'Chat',
  ];
  List<String> lobbyTabBarIcon = [
    'assets/icons/user_group.svg',
    'assets/icons/chat.svg',
  ];

  var lineUpActiveAlignment = Alignment.centerLeft.obs;
  var lineUpTabActive = 'Home'.obs;
  List<String> lineUpTabBarTitle = [
    'Home',
    '',
    'Away',
  ];
}
