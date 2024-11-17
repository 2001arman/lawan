import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/presentation/referee/referee_state.dart';

import '../../../utility/shared/constants/session_type.dart';
import '../../domain/session/session_model.dart';
import '../../infrastructure/arena/arena_data_source.dart';
import '../admin/session/admin_session_bottom_sheet.dart';

class RefereeLogic extends GetxController {
  RefereeState state = RefereeState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  @override
  void onInit() {
    addDummySession();
    super.onInit();
  }

  void image() async {
    final ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery);
  }

  void addDummySession() {
    List<SessionModel> dummySession = [
      SessionModel(
        arena: arenaDataSource.listArena.first,
        selectedCourt: 0,
        dateTime: DateTime.now().add(const Duration(days: 1)),
        startHour: const TimeOfDay(hour: 15, minute: 0),
        endHour: const TimeOfDay(hour: 16, minute: 0),
        totalHour: 1,
        firstName: 'Arman',
        lastName: 'Maulana',
        contactNumber: '32133487',
        identificationNumber: '9831299479',
        price: 20,
      ),
      SessionModel(
        arena: arenaDataSource.listArena.last,
        selectedCourt: 0,
        dateTime: DateTime.now().subtract(const Duration(days: 1)),
        startHour: const TimeOfDay(hour: 15, minute: 0),
        endHour: const TimeOfDay(hour: 16, minute: 0),
        totalHour: 1,
        firstName: 'Arman',
        lastName: 'Maulana',
        contactNumber: '32133487',
        identificationNumber: '9831299479',
        price: 20,
      ),
      SessionModel(
        arena: arenaDataSource.listArena.first,
        selectedCourt: 1,
        dateTime: DateTime.now().add(const Duration(days: 1)),
        startHour: const TimeOfDay(hour: 15, minute: 0),
        endHour: const TimeOfDay(hour: 16, minute: 0),
        totalHour: 1,
        firstName: 'Arman',
        lastName: 'Maulana',
        contactNumber: '32133487',
        identificationNumber: '9831299479',
        price: 20,
      ),
    ];

    state.sessionList.addAll(dummySession);
    state.sessionList.refresh();
  }

  void changeIndex(int index) => state.selectedNavbarIndex.value = index;

  void showDetailSession(SessionModel data) {
    AdminSessionBottomSheet().successCreateSesssionSheet(
      sessionType: state.selectedNavbarIndex.value == 0
          ? SessionType.friendly
          : SessionType.ranked,
      arenaModel: data.arena,
      selectedCourt: data.selectedCourt,
      session: data,
      successCreate: false,
      showPill: true,
      onUpdate: () {},
      onDelete: () {},
      isAdmin: false,
      isReferee: true,
    );
  }
}
