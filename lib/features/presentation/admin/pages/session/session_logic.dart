import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/presentation/admin/pages/session/admin_add_session.dart';
import 'package:lawan/features/presentation/admin/pages/session/admin_session_bottom_sheet.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_state.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/utility/util/custom_dialog_success.dart';

import '../../../../../utility/shared/constants/action_type.dart';
import '../../../../../utility/util/helper.dart';
import '../../../../infrastructure/arena/arena_data_source.dart';

class SessionLogic extends GetxController {
  SessionState state = SessionState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();

  @override
  void onInit() {
    state.listSession[1].sessionsData.add(
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
    );
    state.listSession.refresh();
    super.onInit();
  }

  void showDetailSession({
    required SessionModel sessionData,
    required int dateIndex,
    required int sessionIndex,
  }) {
    AdminSessionBottomSheet().showDetailSessionSheet(
      sessionData: sessionData,
      onDelete: () => deleteSession(
        dateIndex: dateIndex,
        sessionIndex: sessionIndex,
      ),
      onUpdate: () {
        Get.back();
        AdminAddSession(state: state, logic: this).createNewSession(
          sessionData: sessionData,
          dateIndex: dateIndex,
          sessionIndex: sessionIndex,
        );
      },
    );
  }

  void showAddSessionBottomSheet() {
    AdminAddSession(state: state, logic: this).createNewSession();
  }

  PageController setController(PageController controller) =>
      state.pageController = controller;

  PageController setHomeController(PageController controller) =>
      state.homePageController = controller;

  void handleNextButton({
    SessionModel? sessionData,
    int? dateIndex,
    int? sessionIndex,
  }) async {
    if (state.selectedIndex.value == 3) {
      if (state.selectedArenaIndex.value == -1) {
        Helper.showToast(isSuccess: false, message: 'Please choose arena');
        return;
      }
      final validator = state.textFormKey.currentState!.validate();
      if (!validator) return;

      Get.back();
      CustomDialogSuccess.confirmDialog(
        actionType: sessionData != null ? ActionType.edit : ActionType.booking,
        onAction: () async {
          String title = 'Session Succesfully Created';
          if (sessionData != null) {
            updateSession(
              sessionData: sessionData,
              dateIndex: dateIndex!,
              sessionIndex: sessionIndex!,
            );
            title = 'Session Succesfully Updated';
          } else {
            createSession();
          }
          Get.back();
          await AdminSessionBottomSheet().successCreateSesssionSheet(
            arenaModel: arenaDataSource.getArena(
              index: state.selectedArenaIndex.value,
            ),
            onUpdate: () {
              Get.back();
              AdminAddSession(state: state, logic: this).createNewSession(
                sessionData: sessionData,
                dateIndex: dateIndex,
                sessionIndex: sessionIndex,
              );
            },
            onDelete: () => deleteSession(
              dateIndex: (state.listSession.length) - 1,
              sessionIndex: (state.listSession.last.sessionsData.length) - 1,
            ),
            selectedCourt: state.selectedCourtIndex.value,
            session: factorySession(),
            title: title,
          );
          resetState();
        },
      );
      return;
    }
    state.selectedIndex.value++;
  }

  SessionModel factorySession() {
    ArenaModel arena =
        arenaDataSource.getArena(index: state.selectedArenaIndex.value);
    String firstName = state.firstNameController.text;
    String lastName = state.lastNameController.text;
    String contactNumber = state.contactController.text;
    String identificationNumber = state.identificationController.text;
    String price = state.priceController.text;
    DateTime selectedDate = state.selectedDate;

    return SessionModel(
      arena: arena,
      selectedCourt: state.selectedCourtIndex.value,
      dateTime: selectedDate,
      startHour: state.openTime.value,
      endHour: state.closeTime.value,
      totalHour: state.selectedHour.value,
      firstName: firstName,
      lastName: lastName,
      contactNumber: contactNumber,
      identificationNumber: identificationNumber,
      price: int.parse(price),
    );
  }

  void createSession() async {
    int indexDate = state.listSession.indexWhere(
      (session) =>
          session.date ==
          DateFormat('dd MMM').format(factorySession().dateTime),
    );
    if (indexDate != -1) {
      state.listSession[indexDate].sessionsData.add(factorySession());
    } else {
      state.listSession.add(
        SessionDate(
          date: DateFormat('dd MMM')
              .format(factorySession().dateTime), // Date as '23 Sep'
          dayName: Helper.formatDayName(factorySession().dateTime.day),
          sessionsData: [
            factorySession(),
          ],
        ),
      );
    }
    state.listSession.refresh();
    await Future.delayed(const Duration(seconds: 1));
    resetState();
  }

  void updateSession({
    required SessionModel sessionData,
    required int dateIndex,
    required int sessionIndex,
  }) {
    int indexDate = state.listSession.indexWhere(
      (session) =>
          session.date ==
          DateFormat('dd MMM').format(factorySession().dateTime),
    );
    if (indexDate != -1) {
      state.listSession[indexDate].sessionsData.add(factorySession());
    } else {
      state.listSession.add(
        SessionDate(
          date: DateFormat('dd MMM')
              .format(factorySession().dateTime), // Date as '23 Sep'
          dayName: Helper.formatDayName(factorySession().dateTime.day),
          sessionsData: [
            factorySession(),
          ],
        ),
      );
    }
    state.listSession[dateIndex].sessionsData.removeAt(sessionIndex);
    state.listSession.refresh();
  }

  void resetState() {
    state.selectedIndex.value = 1;
    state.selectedDate = DateTime.now();
    state.firstNameController.text = '';
    state.lastNameController.text = '';
    state.contactController.text = '';
    state.identificationController.text = '';
    state.priceController.text = '0';
  }

  void deleteSession({required int dateIndex, required int sessionIndex}) {
    Get.back();
    CustomDialogSuccess.confirmDialog(
      actionType: ActionType.delete,
      onAction: () {
        Get.back();
        state.listSession[dateIndex].sessionsData.removeAt(sessionIndex);
        state.listSession.refresh();
        Helper.showToast(
          isSuccess: true,
          message: 'Session deletion successful',
        );
      },
    );
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Outdoor':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }
}
