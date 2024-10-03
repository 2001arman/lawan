import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/domain/session/session_model.dart';

import '../../../utility/util/helper.dart';

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
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  var selectedArenaIndex = 0.obs;

  var listSession = List.generate(
    7,
    (index) {
      DateTime now = DateTime.now().add(Duration(days: index));
      return SessionDate(
        date: DateFormat('dd MMM').format(now), // Date as '23 Sep'
        dayName: Helper.formatDayName(index), // Day name like 'Mon, Today'
        sessionsData: [], // Example totalData
      );
    },
  ).obs;
}

class SessionDate {
  final String date;
  final String dayName;
  List<SessionModel> sessionsData;

  SessionDate({
    required this.date,
    required this.dayName,
    required this.sessionsData,
  });
}
