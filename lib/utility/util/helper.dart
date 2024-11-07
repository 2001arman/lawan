import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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

  static void showToast({required bool isSuccess, required message}) {
    FToast().init(Get.context!).showToast(
          child: isSuccess
              ? successToast(message: message)
              : Helper.toast(
                  message: message,
                ),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 2),
        );
  }

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

  static Widget successToast({required String message}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: kWhiteColor,
      ),
      child: Text(
        message,
        style: darkGreyTextStyle,
      ),
    );
  }

  static String? regularValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Field cannot be empty';
    }

    // Updated regex to allow only alphabets and spaces (no numbers)
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(data)) {
      return 'Only alphabets and spaces are allowed';
    }

    return null;
  }

  static String? regularValidatorAndNumber(String? data) {
    if (data == null || data.isEmpty) {
      return 'Field cannot be empty';
    }

    // Updated regex to allow alphabets, spaces, and numbers
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!regex.hasMatch(data)) {
      return 'Only alphabets, numbers, and spaces are allowed';
    }

    return null;
  }

  static String? numberValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Field cannot be empty';
    }

    // Updated regex to allow numbers, commas, periods, and hyphens
    final regex = RegExp(r'^[0-9,.\-]+$');
    if (!regex.hasMatch(data)) {
      return 'Only numbers, commas, periods, and hyphens are allowed';
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

  static List<String> monthNames = [
    'All month',
    'January',
    'February',
    'March',
    'April',
    'May',
    "June",
    'July',
    'August',
    'September',
    'Oktober',
    'November',
    'Desember',
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

  static String formatDayAndDate(int index) {
    DateTime now = DateTime.now().add(Duration(days: index));
    String dayName = DateFormat('EEE, dd MMM').format(now); // e.g., "Mon"
    return index <= 1 ? ' ${getDayLabel(index)}, $dayName}' : dayName;
  }

  static String formatFullDate(DateTime date) {
    return DateFormat('EEE, dd MMM yyyy').format(date);
  }

  static String timeBetweenNowAndSession(DateTime sessionDateTime) {
    Duration difference = sessionDateTime.difference(DateTime.now());

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    return '$days days $hours hours $minutes mins $seconds sec';
  }

  static bool isUpcoming(DateTime sessionDateTime) {
    return sessionDateTime.isAfter(DateTime.now());
  }

  static void openCalendar() async {
    // final androidUri = Uri.parse('content://com.android.calendar/time');
    // final iosUri =
    //     Uri.parse('calshow:${DateTime.now().millisecondsSinceEpoch}');

    // if (Platform.isAndroid) {
    //   if (await canLaunchUrl(androidUri)) {
    //     await launchUrl(androidUri);
    //   }
    // } else if (Platform.isIOS) {
    //   if (await canLaunchUrl(iosUri)) {
    //     await launchUrl(iosUri);
    //   }
    // }
    final Event event = Event(
      title: 'Event Lawan',
      description: 'Event Lawan description',
      location: 'Event Lawan location',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(hours: 1)),
    );
    Add2Calendar.addEvent2Cal(event);
  }
}
