import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/session/avatar_model.dart';

class PlayerMainState {
  var selectedNavbarIndex = 0.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Public'.obs;
  List<String> tabBarTitle = [
    'Public',
    'Private',
  ];

  // add new session
  var calendarFormat = CalendarFormat.month.obs;
  PageController pageController = PageController();
  var selectedIndex = 1.obs;
  // create Arena
  var selectedArenaIndex = (-1).obs;
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
  ].obs;

  var listFriendsRecent = [
    AvatarModel(
      name: 'Yahya Sarah',
      asset: 'assets/avatars/avatar1.png',
      position: 'GK',
      isSelected: false.obs,
    ),
    AvatarModel(
      name: 'Sarah Indah',
      asset: 'assets/avatars/avatar2.png',
      position: 'MF',
      isSelected: false.obs,
    ),
  ].obs;

  var selectedFriends = <AvatarModel>[].obs;

  // age range
  var enableAge = true.obs;
  var ageStart = 25.obs;
  var ageEnd = 35.obs;

  // slot range
  var enableSlot = true.obs;
  var slotStart = 22.obs;
  var slotEnd = 23.obs;

  // gender
  var isMale = true.obs;
  var isFemale = false.obs;

  //language
  var isEnglish = true.obs;
  var isMalay = false.obs;

  var sessionList = <SessionModel>[].obs;

  List<NavbarItem> listNavbarItem = [
    NavbarItem(name: 'Friendly', icon: 'assets/icons/session.svg'),
    NavbarItem(name: 'Ranked', icon: 'assets/icons/ranked.svg'),
    NavbarItem(name: 'Club', icon: 'assets/icons/club.svg'),
    NavbarItem(name: 'Top', icon: 'assets/icons/trophy.svg'),
    NavbarItem(name: 'Stories', icon: 'assets/icons/stories.svg'),
  ];
}

class NavbarItem {
  final String name, icon;

  NavbarItem({required this.name, required this.icon});
}
