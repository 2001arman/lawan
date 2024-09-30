// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/utility/util/helper.dart';

class AdminMainState {
  final textFormKey = GlobalKey<FormState>();
  var selectedIndex = 1.obs;
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Details'.obs;
  List<String> tabBarTitle = [
    'Details',
    'Hour',
    'Rate',
  ];

  var listArena = <ArenaModel>[].obs;
  var selectedListArena = 0.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  var uploadedPictures = <XFile>[
    XFile('empty'),
  ].obs;
  var selectedArenaType = 'Indoor'.obs;
  var selectedFlooringType = 'Court Turf'.obs;

  List<String> arenaType = ["Indoor", "Outdoor"];
  List<String> flooringType = ["Court Turf", "Court Grass", "Cement"];
  var rateList = [
    RateModel(name: 'Weekend Rate', price: 10.obs, hour: 1.0.obs),
    RateModel(name: 'Weekdays Rate', price: 10.obs, hour: 1.0.obs),
  ];

  var listOperationalHour = List.generate(
    7,
    (index) => OperationalHour(
      isActive: true.obs,
      dayName: Helper.dayName[index],
      openTime: const TimeOfDay(hour: 9, minute: 00).obs,
      closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
      chooseTime: false.obs,
    ),
  );
}

enum ArenaType {
  arena,
  court;

  String get title {
    switch (this) {
      case ArenaType.arena:
        return 'Arena';
      case ArenaType.court:
        return 'Court';
      default:
        return '';
    }
  }
}

enum ActionType {
  delete,
  edit;

  String get title {
    switch (this) {
      case ActionType.delete:
        return 'Delete';
      case ActionType.edit:
        return 'Update';
      default:
        return '';
    }
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

class ArenaModel {
  final List<XFile> pictures;
  final String location;
  String name;
  String courtName;
  final String arenaType;
  final String flooringType;
  final List<OperationalHour> operationalHours;
  final List<RateModel> rateArena;

  ArenaModel({
    required this.pictures,
    required this.location,
    required this.name,
    required this.courtName,
    required this.arenaType,
    required this.flooringType,
    required this.operationalHours,
    required this.rateArena,
  });
}
