import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/session/avatar_model.dart';
import '../../../domain/session/session_model.dart';

class RankedMainState {
  var selectedNavbarIndex = 0.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Public'.obs;
  List<String> tabBarTitle = [
    'Public',
    'Private',
  ];

  var listFriends = <AvatarModel>[].obs;
  var sessionList = <SessionModel>[].obs;

  List<AvatarModel> listFriendsDummy = [
    AvatarModel(
      name: 'Sarah Yahya',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    AvatarModel(
      name: 'Sarah Yahyi',
      asset: 'assets/avatars/avatar2.png',
      position: 'MF',
      isSelected: false.obs,
    ),
    AvatarModel(
      name: 'Saiful Bukhari',
      asset: 'assets/avatars/avatar3.png',
      position: 'GK',
      isSelected: false.obs,
    ),
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
    )
  ];
}
