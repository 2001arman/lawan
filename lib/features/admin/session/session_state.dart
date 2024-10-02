import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionState {
  var selectedIndex = 1.obs;

  PageController pageController = PageController();

  List<int> optionHour = [1, 2, 3, 4, 5];
  var selectedHour = 1.obs;

  var openTime = const TimeOfDay(hour: 9, minute: 00).obs;
  var closeTime = const TimeOfDay(hour: 18, minute: 00).obs;

  // arena
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Indoor'.obs;
  List<String> tabBarTitle = [
    'Indoor',
    'Outdoor',
  ];

  var listSession = [
    SessionDate(
      date: '23 Sep',
      dayName: 'Sun, Today',
      totalData: 0,
    ),
    SessionDate(
      date: '24 Sep',
      dayName: 'Mon, Tomorrow',
      totalData: 2,
    ),
    SessionDate(
      date: '25 Sep',
      dayName: 'Tue',
      totalData: 1,
    ),
    SessionDate(
      date: '26 Sep',
      dayName: 'Wed',
      totalData: 2,
    ),
    SessionDate(
      date: '27 Sep',
      dayName: 'Thu',
      totalData: 2,
    ),
  ];
}

class SessionDate {
  final String date;
  final String dayName;
  final int totalData;

  SessionDate(
      {required this.date, required this.dayName, required this.totalData});
}
