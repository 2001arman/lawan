import 'package:get/get.dart';

import '../../../domain/session/avatar_model.dart';

class LineupFriendlyState {
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
}
