import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindFriendState {
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Search'.obs;
  List<String> tabBarTitle = [
    'Search',
    'Facebook',
    'Contact',
  ];

  TextEditingController searchController = TextEditingController();
  RxBool showFriend = false.obs;

  List<RxBool> listFriends = [
    false.obs,
    true.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];
}
