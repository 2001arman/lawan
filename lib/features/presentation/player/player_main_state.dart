import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerMainState {
  var selectedNavbarIndex = 0.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Public'.obs;
  List<String> tabBarTitle = [
    'Public',
    'Private',
  ];

  List<String> friendList = [
    'Saiful Bukhari',
    'Shahirah Liyana',
    'Tere Liye',
    'Upin Ipin'
  ];

  // add new session
  PageController pageController = PageController();
  var selectedIndex = 1.obs;
  // create Arena
  var selectedArenaIndex = 0.obs;
  var selectedCourtIndex = 0.obs;

  List<int> optionHour = [1, 2, 3, 4, 5];

  DateTime selectedDate = DateTime.now();
  var selectedHour = 1.obs;
  var openTime = const TimeOfDay(hour: 9, minute: 00).obs;
  var closeTime = const TimeOfDay(hour: 10, minute: 00).obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController identificationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
}
