import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../utility/util/helper.dart';

class SessionState {
  var selectedIndex = 1.obs;

  PageController homePageController = PageController();
  PageController pageController = PageController();
  List<int> optionHour = [1, 2, 3, 4, 5];

  var calendarFormat = CalendarFormat.week.obs;

  // arena
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Indoor'.obs;
  List<String> tabBarTitle = [
    'Indoor',
    'Outdoor',
  ];

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

  // create Arena
  var selectedArenaIndex = (-1).obs;
  var selectedCourtIndex = 0.obs;

  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  var selectedHour = 2.obs;
  var openTime = const TimeOfDay(hour: 9, minute: 00).obs;
  var closeTime = const TimeOfDay(hour: 10, minute: 00).obs;

  final textFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController identificationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  
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
