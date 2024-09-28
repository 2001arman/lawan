// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMainState {
  var selectedIndex = 1.obs;
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Details'.obs;
  List<String> tabBarTitle = [
    'Details',
    'Hour',
    'Rate',
  ];

  var rateList = [
    RateModel(name: 'Weekend Rate', price: 300.obs, hour: 1.0.obs),
    RateModel(name: 'Weekdays Rate', price: 200.obs, hour: 1.0.obs),
  ].obs;

  var listOperationalHour = [
    OperationalHour(
      isActive: false.obs,
      dayName: 'Sunday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Monday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Tuesday (Today)',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Wednesday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Thursday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: true.obs,
      dayName: 'Friday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
    OperationalHour(
      isActive: false.obs,
      dayName: 'Saturday',
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
  ].obs;
}

class OperationalHour {
  Rx<bool> isActive;
  String dayName;
  Rx<TimeOfDay> openTime;
  Rx<TimeOfDay> closeTIme;
  Rx<bool> chooseTime;

  OperationalHour({
    required this.isActive,
    required this.dayName,
    required this.openTime,
    required this.closeTIme,
    required this.chooseTime,
  });
}

class RateModel {
  final String name;
  Rx<int> price;
  Rx<double> hour;
  Rx<int> finalPrice;

  RateModel({
    required this.name,
    required this.price,
    required this.hour,
  }) : finalPrice = (price.value + (price * 0.2).toInt()).obs;
}
