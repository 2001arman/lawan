import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utility/util/helper.dart';
import '../../../../../domain/arena/arena_model.dart';

class AdminArenaState {
  final textFormKey = GlobalKey<FormState>();
  var selectedIndex = 1.obs;

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Details'.obs;
  List<String> tabBarTitle = [
    'Details',
    'Hour',
    'Rate',
  ];

  late Rx<ArenaModel> selectedArena;
  late Rx<CourtModel> selectedCourt;
  var selectedListArena = 0.obs;
  var selectedListCourt = 0.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  var uploadedPictures = <XFile>[
    XFile('empty'),
  ].obs;

  var selectedArenaType = 'Indoor'.obs;
  var selectedFlooringType = 'Turf'.obs;

  List<String> arenaType = ["Indoor", "Outdoor"];
  List<String> flooringType = ["Turf", "Grass", "Cement"];
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

  // edit arena
  var isEditing = false.obs;
}
