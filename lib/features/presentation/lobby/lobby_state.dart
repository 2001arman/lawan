import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

import '../player/controller/player_main_state.dart';

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

  // referee states
  late bool isReferee;
  var selectedPlayerIndex = (-1).obs;
  var isStarting = false.obs;
  var selectedNavbarIndex = 0.obs;

  Rxn<NavbarItem> selectedAction = Rxn();

  List<NavbarItem> listNavbarItem = [
    NavbarItem(
      name: 'MVP',
      icon: 'assets/icons/user.svg',
      gradient: goldGradient,
      activeGradient: goldGradient,
    ),
    NavbarItem(
      name: 'Save',
      icon: 'assets/icons/shield.svg',
      gradient: mainGradient,
      activeGradient: redGradient,
    ),
    NavbarItem(
      name: 'Assist',
      icon: 'assets/icons/chevron-double-right.svg',
      gradient: mainGradient,
      activeGradient: blueGradient,
    ),
    NavbarItem(
      name: 'Goal',
      icon: 'assets/icons/target.svg',
      gradient: mainGradient,
      activeGradient: mainGradient,
    ),
  ];
}
