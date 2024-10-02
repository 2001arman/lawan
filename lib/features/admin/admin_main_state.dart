// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/utility/util/helper.dart';

import '../domain/arena/arena_model.dart';

class AdminMainState {
  var selectedNavbarIndex = 1.obs;

  final textFormKey = GlobalKey<FormState>();
  var selectedIndex = 1.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Details'.obs;
  List<String> tabBarTitle = [
    'Details',
    'Hour',
    'Rate',
  ];

  var selectedListArena = 0.obs;
  var selectedListCourt = 0.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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
  booking,
  edit;

  String get title {
    switch (this) {
      case ActionType.delete:
        return 'Delete?';
      case ActionType.edit:
        return 'Update?';
      case ActionType.booking:
        return 'Booking';
      default:
        return '';
    }
  }

  String get description {
    switch (this) {
      case ActionType.delete:
        return 'Proceed with applying the changes.';
      case ActionType.edit:
        return 'Proceed with applying the changes.';
      case ActionType.booking:
        return 'Are you sure you want to add this booking?';
      default:
        return '';
    }
  }
}
