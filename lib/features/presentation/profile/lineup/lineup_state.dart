import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/session/avatar_model.dart';

class LineupState {
  var lineUpActiveAlignment = Alignment.centerLeft.obs;
  var lineUpTabActive = 'Home'.obs;
  List<String> lineUpTabBarTitle = [
    'Home',
    '',
    'Away',
  ];

  var selectedFriends = [
    AvatarModel(
      name: 'Samantha',
      asset: 'assets/avatars/avatar4.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    AvatarModel(
      name: 'Sarah Yahya',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
      isSelected: false.obs,
    ),
  ].obs;
}
