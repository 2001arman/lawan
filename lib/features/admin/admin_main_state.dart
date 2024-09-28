import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMainState {
  var selectedIndex = 1.obs;

  var rateList = [
    RateModel(name: 'Weekend Rate', price: 300, hour: 1),
    RateModel(name: 'Weekdays Rate', price: 200, hour: 1),
  ].obs;

  var listOperationalHour = [
    OperationalHour(
      isActive: false.obs,
      dayName: 'Sunday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Monday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Tuesday (Today)',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Wednesday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Thursday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Friday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
    OperationalHour(
      isActive: false.obs,
      dayName: 'Saturday',
      openTime: const TimeOfDay(hour: 9, minute: 00),
      closeTIme: const TimeOfDay(hour: 18, minute: 00),
    ),
  ].obs;
}

class OperationalHour {
  Rx<bool> isActive;
  String dayName;
  TimeOfDay openTime;
  TimeOfDay closeTIme;

  OperationalHour({
    required this.isActive,
    required this.dayName,
    required this.openTime,
    required this.closeTIme,
  });
}

class RateModel {
  final String name;
  int price;
  int hour;
  int finalPrice;

  RateModel({
    required this.name,
    required this.price,
    required this.hour,
  }) : finalPrice = (price + (price * 0.2).toInt());
}
