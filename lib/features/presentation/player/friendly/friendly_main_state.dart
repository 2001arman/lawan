import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/session/avatar_model.dart';
import '../../../domain/session/session_model.dart';

class FriendlyMainState {
  var selectedNavbarIndex = 0.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Public'.obs;
  List<String> tabBarTitle = [
    'Public',
    'Private',
  ];

  var listFriends = <AvatarModel>[].obs;
  var sessionList = <SessionModel>[].obs;
}
