import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/admin/admin_add_arena.dart';
import 'package:lawan/features/admin/admin_main_state.dart';
import 'package:lawan/utility/util/custom_dialog.dart';
import 'package:lawan/utility/util/custom_dialog_success.dart';
import 'package:lawan/utility/util/helper.dart';

class AdminMainLogic extends GetxController {
  AdminMainState state = AdminMainState();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  bool checkValidator() {
    return state.textFormKey.currentState!.validate();
  }

  void showEditAddDialog() {
    CustomDialog.editAddDialog(onTapAdd: () {
      Get.back();
      createNewArena();
    }, onTapEdit: () {
      Get.back();
      editArena(arenaType: ArenaType.arena);
    });
  }

  // void onSearchFriend(String name) async {
  //   if (_debounce?.isActive ?? false) _debounce?.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 500), () async {
  //     state.selectedFriendId.value = '';
  //     state.tempListFriends.assignAll(
  //       state.listFriends
  //           .where((friend) =>
  //               friend.name.toLowerCase().contains(name.toLowerCase()))
  //           .toList(),
  //     );
  //   });
  // }

  void chooseArenaDialog() {
    CustomDialog.chooseArenaDialog(
      listArena: state.listArena,
      selectedArena: state.selectedListArena.value,
      onSelected: (index) {
        Get.back();
        state.selectedListArena.value = index;
      },
      onSearch: (name) => Get.log('cek search'),
    );
  }

  void editArena({required ArenaType arenaType}) {
    String data = '';
    switch (arenaType) {
      case ArenaType.arena:
        data = state.listArena[state.selectedListArena.value].name;
        break;
      default:
        data = state.listArena[state.selectedListArena.value].courtName;
        break;
    }
    CustomDialogSuccess.editArenaDialog(
      arenaType: arenaType,
      data: data,
      onAction: (newData) {
        if (arenaType == ArenaType.arena) {
          state.listArena[state.selectedListArena.value].name = newData;
        } else {
          state.listArena[state.selectedListArena.value].courtName = newData;
        }
        Get.back();
        state.listArena.refresh();
      },
      onDelete: () {
        state.listArena.removeAt(state.selectedListArena.value);
        Get.back();
        state.listArena.refresh();
      },
    );
  }

  void createNewArena() {
    AdminAddArena(state: state, logic: this).createNewArena();
  }

  void handleNextButton() async {
    if (state.selectedIndex.value == 1) {
      final validator = state.textFormKey.currentState!.validate();
      if (!validator) return;
      state.selectedIndex.value++;
    } else if (state.selectedIndex.value == 3) {
      final validationName = Helper.regularValidator(state.nameController.text);
      final validationCourt =
          Helper.regularValidator(state.courtController.text);
      if (validationName != null && validationCourt != null) {
        FToast().init(Get.context!).showToast(
              child: Helper.toast(
                message: 'Please fill Arena and Court name',
              ),
              gravity: ToastGravity.BOTTOM,
              toastDuration: const Duration(seconds: 2),
            );
        return;
      }
      createArena();
      Get.back();
      await Future.delayed(const Duration(seconds: 1));
      CustomDialogSuccess.successCreateArena();
    } else {
      state.selectedIndex.value++;
    }
  }

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
    state.uploadedPictures.assignAll([
      XFile('empty'),
    ]);
  }

  void image() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> image = await picker.pickMultiImage(
      imageQuality: 10,
      limit: 5,
    );
    if (image.isNotEmpty) {
      state.uploadedPictures.insertAll(0, image);
    }
  }

  void changeImage({required int index}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      state.uploadedPictures.removeAt(index);
      state.uploadedPictures.insert(index, image);
    }
  }

  void deleteImage({required int index}) {
    state.uploadedPictures.removeAt(index);
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
