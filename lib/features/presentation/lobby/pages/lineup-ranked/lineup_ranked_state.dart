import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../domain/session/avatar_model.dart';

class LineupRankedState {
  var lineUpActiveAlignment = Alignment.centerLeft.obs;
  var lineUpTabActive = 'Home'.obs;
  List<String> lineUpTabBarTitle = [
    'Home',
    '',
    'Away',
  ];

  var listFriends = [
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
  ].obs;

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

  var selectedRefereeIndex = 0.obs;
  var showTick = 0.obs;

  var availableSlot = 3.obs;

  var homeLineUp = <AvatarModel?>[
    AvatarModel(
      name: 'Samantha',
      asset: 'assets/avatars/avatar4.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    AvatarModel(
      name: 'Sarah Yahya',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    AvatarModel(
      name: 'Jesse James',
      asset: 'assets/avatars/avatar4.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    null,
    AvatarModel(
      name: 'Saiful Bukhari',
      asset: 'assets/avatars/avatar3.png',
      position: 'GK',
      isSelected: false.obs,
    ),
  ].obs;

  var awayLineUp = <AvatarModel?>[
    AvatarModel(
      name: 'Shahirah Liyana',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    AvatarModel(
      name: 'Saiful Bukhari',
      asset: 'assets/avatars/avatar2.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    AvatarModel(
      name: 'Jakub Ehsan',
      asset: 'assets/avatars/avatar3.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    null,
    null,
    null,
    AvatarModel(
      name: 'Mike Asto',
      asset: 'assets/avatars/avatar4.png',
      position: 'GK',
      isSelected: false.obs,
    ),
  ].obs;

  AvatarModel myProfile = AvatarModel(
    name: 'Arman Maulana',
    asset: 'assets/avatars/avatar2.png',
    position: 'GK',
    isSelected: false.obs,
  );

  GlobalKey keyField = GlobalKey();
}
