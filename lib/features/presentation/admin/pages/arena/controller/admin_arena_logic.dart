import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/presentation/admin/pages/arena/controller/admin_arena_state.dart';

import '../../../../../../utility/shared/constants/arena_type.dart';
import '../../../../../../utility/util/dialogs/custom_dialog.dart';
import '../../../../../../utility/util/dialogs/custom_dialog_success.dart';
import '../../../../../../utility/util/helper.dart';
import '../../../../../domain/arena/arena_model.dart';
import '../../../../../infrastructure/arena/arena_data_source.dart';
import '../admin_add_arena.dart';

class AdminArenaLogic extends GetxController {
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();
  AdminArenaState state = AdminArenaState();

  @override
  void onInit() {
    super.onInit();
    if (arenaDataSource.listArena.isNotEmpty) {
      // Use the copy method to avoid referencing the original object
      ArenaModel arenaModel =
          arenaDataSource.listArena[state.selectedListArena.value].copy();
      CourtModel courtModel =
          arenaModel.courtData[state.selectedListCourt.value];
      state.selectedArena = arenaModel.obs;
      state.selectedCourt = courtModel.obs;
    }
  }

  void alignmentTabbar(String title) {
    switch (title) {
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

  void showEditAddDialog({
    required VoidCallback createFunction,
    required ArenaType arenaType,
  }) {
    CustomDialog.editAddDialog(
      onTapAdd: () {
        Get.back();
        // createNewArena();
        createFunction();
      },
      onTapEdit: () {
        Get.back();
        editArena(arenaType: arenaType);
      },
    );
  }

  void chooseArenaDialog() {
    CustomDialog.chooseArenaDialog(
      listArena: arenaDataSource.listArena,
      selectedArena: state.selectedListArena.value,
      onSelected: (index) {
        Get.back();
        state.selectedListArena.value = index;
        state.selectedArena.value = arenaDataSource.listArena[index];
        state.selectedCourt.value = state.selectedArena.value.courtData.first;
      },
      onSearch: (name) {},
    );
  }

  void editArena({required ArenaType arenaType}) {
    String data = '';
    switch (arenaType) {
      case ArenaType.arena:
        data = arenaDataSource.listArena[state.selectedListArena.value].name;
        break;
      default:
        data = arenaDataSource.listArena[state.selectedListArena.value]
            .courtData[state.selectedListCourt.value].courtName;
        break;
    }
    CustomDialogSuccess.editArenaDialog(
      arenaType: arenaType,
      data: data,
      onAction: (newData) {
        if (arenaType == ArenaType.arena) {
          Helper.showToast(isSuccess: true, message: 'Update arena successful');
          arenaDataSource.editArenaName(
              index: state.selectedListArena.value, name: newData);
        } else {
          Helper.showToast(isSuccess: true, message: 'Update court successful');
          arenaDataSource.editCourtName(
            arenaIndex: state.selectedListArena.value,
            courtIndex: state.selectedListCourt.value,
            name: newData,
          );
        }
        Get.back();
        state.selectedArena.value =
            arenaDataSource.listArena[state.selectedListArena.value];
      },
      onDelete: () {
        if (arenaType == ArenaType.arena) {
          Helper.showToast(isSuccess: true, message: 'Delete arena successful');
          arenaDataSource.deleteArena(index: state.selectedListArena.value);

          if (arenaDataSource.listArena.isNotEmpty) {
            state.selectedArena.value = arenaDataSource.listArena.first;
            state.selectedCourt.value =
                arenaDataSource.listArena.first.courtData.first;
          }
        } else {
          Helper.showToast(isSuccess: true, message: 'Delete court successful');
          arenaDataSource.deleteCourt(
            arenaIndex: state.selectedListArena.value,
            courtIndex: state.selectedListCourt.value,
          );

          if (arenaDataSource.listArena.isNotEmpty) {
            state.selectedCourt.value =
                arenaDataSource.listArena.first.courtData.first;
          }
        }
        Get.back();
        state.selectedArena.value =
            arenaDataSource.listArena[state.selectedListArena.value];
      },
    );
  }

  void createNewArena() {
    AdminAddArena(state: state, logic: this).createNewArena();
  }

  void createNewCourt() {
    AdminAddArena(state: state, logic: this).createNewArena(
      arenaData: arenaDataSource.getArena(index: state.selectedListArena.value),
      arenaType: ArenaType.court,
    );
  }

  void handleNextButton({ArenaModel? arenaData}) async {
    final isHaveImage = state.uploadedPictures.length > 1;
    if (state.selectedIndex.value == 1) {
      final validator = state.textFormKey.currentState!.validate();
      if (!validator || !isHaveImage) {
        Helper.showToast(
          isSuccess: false,
          message: 'Please fill Arena, Court name and Picture',
        );
        return;
      }
      state.selectedIndex.value++;
    } else if (state.selectedIndex.value == 3) {
      final validationName = Helper.regularValidator(state.nameController.text);
      final validationCourt =
          Helper.regularValidator(state.courtController.text);
      if (validationName != null && validationCourt != null || !isHaveImage) {
        Helper.showToast(
          isSuccess: false,
          message: 'Please fill Arena, Court name and Picture',
        );
        return;
      }
      if (arenaData != null) {
        createCourt();
      } else {
        createArena();
      }
      Get.back();
      await Future.delayed(const Duration(seconds: 1));
      CustomDialogSuccess.successCreateArena(
        ontapAddCourt: () {
          Get.back();
          createNewCourt();
        },
      );
    } else {
      state.selectedIndex.value++;
    }
  }

  void createArena() {
    List<XFile> uploaded = [];
    uploaded.addAll(state.uploadedPictures);

    CourtModel courtModel = CourtModel(
      courtName: state.courtController.text,
      pictures: uploaded,
      arenaType: state.selectedArenaType.value,
      flooringType: state.selectedFlooringType.value,
      operationalHours: state.listOperationalHour,
      rateArena: state.rateList,
    );

    ArenaModel arena = ArenaModel(
      location: 'Selangor',
      name: state.nameController.text,
      courtData: [courtModel],
    );
    arenaDataSource.addArena(arena: arena);
    state.selectedArena = arena.obs;
    state.selectedCourt = courtModel.obs;
    state.selectedListArena.value = arenaDataSource.listArena.length - 1;
    clearState();
  }

  void createCourt() {
    List<XFile> uploaded = [];
    uploaded.addAll(state.uploadedPictures);

    CourtModel courtModel = CourtModel(
      courtName: state.courtController.text,
      pictures: uploaded,
      arenaType: state.selectedArenaType.value,
      flooringType: state.selectedFlooringType.value,
      operationalHours: state.listOperationalHour,
      rateArena: state.rateList,
    );

    arenaDataSource.addCourt(
        arenaIndex: state.selectedListArena.value, court: courtModel);
    arenaDataSource.listArena.refresh();
    state.selectedCourt.value = courtModel;
    state.selectedListCourt++;
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

  void updateCancel() {
    state.isEditing.value = false;
    state.selectedCourt.value = arenaDataSource
        .listArena[state.selectedListArena.value]
        .courtData[state.selectedListCourt.value]
        .copy();

    state.selectedCourt.refresh();
  }

  void updateAddimage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> image = await picker.pickMultiImage(
      imageQuality: 10,
      limit: 5,
    );
    if (image.isNotEmpty) {
      state.selectedCourt.value.pictures.insertAll(0, image);
      state.selectedCourt.value.pictureType = PictureType.file;
      state.selectedCourt.refresh();
    }
  }

  void updateDeleteImage({required int index}) {
    state.selectedCourt.value.pictures.removeAt(index);
    state.selectedCourt.refresh();
    state.isEditing.value = true;
  }

  void updateChangeImage({required int index}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      state.selectedCourt.value.pictures.removeAt(index);
      state.selectedCourt.value.pictures.insert(index, image);
      state.selectedCourt.value.pictureType = PictureType.file;
      state.selectedCourt.refresh();
      state.isEditing.value = true;
    }
  }

  void updateArenaType({required String arenaType}) {
    state.selectedCourt.value.arenaType = arenaType;
    state.selectedCourt.refresh();
    state.isEditing.value = true;
  }

  void updateFlooringType({required String flooringType}) {
    state.selectedCourt.value.flooringType = flooringType;
    state.selectedCourt.refresh();
    state.isEditing.value = true;
  }

  void saveUpdate() {
    arenaDataSource.listArena[state.selectedListArena.value]
            .courtData[state.selectedListCourt.value] =
        state.selectedCourt.value.copy();
    state.isEditing.value = false;

    Helper.showToast(isSuccess: true, message: 'Update court successful');
  }
}
