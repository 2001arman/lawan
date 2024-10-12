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

  // Copy method
  ArenaModel copy() {
    return ArenaModel(
      location: location,
      name: name,
      courtData: courtData.map((court) => court.copy()).toList(),
    );
  }
}

enum PictureType {
  asset,
  file;
}

class CourtModel {
  String courtName;
  final List<XFile> pictures;
  PictureType pictureType;
  String arenaType;
  String flooringType;
  final List<OperationalHour> operationalHours;
  final List<RateModel> rateArena;

  CourtModel({
    required this.pictures,
    this.pictureType = PictureType.file,
    required this.courtName,
    required this.arenaType,
    required this.flooringType,
    required this.operationalHours,
    required this.rateArena,
  });

  // Copy method
  CourtModel copy() {
    return CourtModel(
      pictures: List<XFile>.from(pictures), // Create a copy of the list
      pictureType: pictureType,
      courtName: courtName,
      arenaType: arenaType,
      flooringType: flooringType,
      operationalHours: operationalHours.map((hour) => hour.copy()).toList(),
      rateArena: rateArena.map((rate) => rate.copy()).toList(),
    );
  }
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

  // Copy method
  OperationalHour copy() {
    return OperationalHour(
      isActive: isActive.value.obs,
      dayName: dayName,
      openTime: openTime.value.obs,
      closeTIme: closeTIme.value.obs,
      chooseTime: chooseTime.value.obs,
    );
  }
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

  // Copy method
  RateModel copy() {
    return RateModel(
      name: name,
      price: price.value.obs,
      hour: hour.value.obs,
    );
  }
}
