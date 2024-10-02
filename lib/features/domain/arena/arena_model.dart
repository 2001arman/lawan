// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ArenaModel {
  final String location;
  String name;
  List<CourtModel> courtData;

  ArenaModel({
    required this.location,
    required this.name,
    required this.courtData,
  });
}

class CourtModel {
  String courtName;
  final List<XFile> pictures;
  final String arenaType;
  final String flooringType;
  final List<OperationalHour> operationalHours;
  final List<RateModel> rateArena;

  CourtModel({
    required this.pictures,
    required this.courtName,
    required this.arenaType,
    required this.flooringType,
    required this.operationalHours,
    required this.rateArena,
  });
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
