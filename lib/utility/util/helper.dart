import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
}
