import 'package:get/get.dart';

import '../../../../../domain/session/avatar_model.dart';

class LineupState {
  var listFriends = [
    AvatarModel(
      name: 'Sarah Yahya',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
    ),
    AvatarModel(
      name: 'Sarah Yahyi',
      asset: 'assets/avatars/avatar2.png',
      position: 'MF',
    ),
    AvatarModel(
      name: 'Saiful Bukhari',
      asset: 'assets/avatars/avatar3.png',
      position: 'GK',
    ),
  ].obs;

  var selectedFriends = [
    AvatarModel(
      name: 'Samantha',
      asset: 'assets/avatars/avatar4.png',
      position: 'GK',
    ),
    AvatarModel(
      name: 'Sarah Yahya',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
    ),
  ].obs;
}
