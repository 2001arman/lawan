import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/admin/admin_add_arena.dart';
import 'package:lawan/features/admin/admin_main_state.dart';
import 'package:lawan/utility/util/helper.dart';

class AdminMainLogic {
  AdminMainState state = AdminMainState();

  void createArena() {
    List<XFile> uploaded = [];
    uploaded.addAll(state.uploadedPictures);

    ArenaModel arena = ArenaModel(
      pictures: uploaded,
      location: 'Selangor',
      name: state.nameController.text,
      courtName: state.courtController.text,
      arenaType: state.selectedArenaType.value,
      flooringType: state.selectedFlooringType.value,
      operationalHours: state.listOperationalHour,
      rateArena: state.rateList,
    );
    state.listArena.add(arena);
    clearState();
  }

  void clearState() {
    state.selectedIndex.value = 1;
    state.nameController.text = '';
    state.courtController.text = '';
    state.selectedArenaType.value = state.arenaType.first;
    state.selectedFlooringType.value = state.flooringType.first;
    state.listOperationalHour = List.generate(
      7,
      (index) => OperationalHour(
        isActive: true.obs,
        dayName: Helper.dayName[index],
        openTime: const TimeOfDay(hour: 9, minute: 00).obs,
        closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
        chooseTime: true.obs,
      ),
    );
    state.rateList = [
      RateModel(name: 'Weekend Rate', price: 10.obs, hour: 1.0.obs),
      RateModel(name: 'Weekdays Rate', price: 10.obs, hour: 1.0.obs),
    ];
    state.uploadedPictures.clear();
  }

  void image() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> image = await picker.pickMultiImage(imageQuality: 10);
    if (image.isNotEmpty) {
      state.uploadedPictures.addAll(image);
    }
  }

  void createNewArena() {
    AdminAddArena(state: state, logic: this).createNewArena();
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Details':
        state.activeAlignment.value = Alignment.centerLeft;
        break;
      case 'Hour':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Rate':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }
}
