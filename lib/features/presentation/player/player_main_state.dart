import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/session/avatar_model.dart';

class PlayerMainState {
  var selectedNavbarIndex = 0.obs;

  List<NavbarItem> listNavbarItem = [
    NavbarItem(name: 'Friendly', icon: 'assets/icons/session.svg'),
    NavbarItem(name: 'Ranked', icon: 'assets/icons/ranked.svg'),
    NavbarItem(name: 'Club', icon: 'assets/icons/club.svg'),
    NavbarItem(name: 'Top', icon: 'assets/icons/trophy.svg'),
    NavbarItem(name: 'Stories', icon: 'assets/icons/stories.svg'),
  ];
  var selectedFriends = <AvatarModel>[].obs;
}

class NavbarItem {
  final String name, icon;
  final LinearGradient? gradient, activeGradient;

  NavbarItem({
    required this.name,
    required this.icon,
    this.gradient,
    this.activeGradient,
  });
}
