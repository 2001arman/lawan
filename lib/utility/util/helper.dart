import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/constants/constants_ui.dart';

class Helper {
  static String formatTime12Hour(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // 'jm' -> 12-hour format with AM/PM
    return format.format(dt);
  }

  static List<String> dayName = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  static Widget toast({required String message}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: kRedColor,
      ),
      child: Text(
        message,
        style: whiteTextStyle,
      ),
    );
  }

  static String? regularValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Field cannot be empty';
    }

    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regex.hasMatch(data)) {
      return 'Only alphabets and numbers are allowed';
    }

    return null;
  }

  static List<String> dayNames = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  static String getDayLabel(int index) {
    if (index == 0) {
      return 'Today';
    } else if (index == 1) {
      return 'Tomorrow';
    } else {
      return dayNames[DateTime.now().add(Duration(days: index)).weekday % 7];
    }
  }

  static String formatDayName(int index) {
    DateTime now = DateTime.now().add(Duration(days: index));
    String dayName = DateFormat('EEE').format(now); // e.g., "Mon"
    return index <= 1 ? '$dayName, ${getDayLabel(index)}' : dayName;
  }
}
