import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/features/presentation/player/controller/player_main_state.dart';
import 'package:lawan/features/presentation/player/payment/checkout/ui/checkout_ui.dart';
import 'package:lawan/utility/util/helper.dart';
import 'package:lawan/utility/util/helper_data.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/session/avatar_model.dart';
import '../../../infrastructure/arena/arena_data_source.dart';
import '../../admin/pages/session/admin_add_session.dart';
import '../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../admin/pages/session/session_logic.dart';
import '../ui/player_add_session.dart';

class PlayerMainLogic extends GetxController {
  PlayerMainState state = PlayerMainState();
  ArenaDataSource arenaDataSource = Get.find<ArenaDataSource>();
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(
      'assets/video/empty_session.mp4',
      videoPlayerOptions: VideoPlayerOptions(),
    );
    state.listFriends.addAll(HelperData.listFriends);
  }

  @override
  void dispose() {
    super.dispose();
    disposeVideo();
  }

  @override
  void onClose() {
    disposeVideo();
    super.onClose();
  }

  void disposeVideo() {
    videoPlayerController.dispose();
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Public':
        state.activeAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.activeAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  void onSelectedArena(int arenaIndex, int courtInted) {
    state.selectedArenaIndex.value = arenaIndex;
    state.selectedCourtIndex.value = courtInted;
  }

  void handleNextButton() async {
    if (state.selectedIndex.value == 3 || state.selectedIndex.value == 2) {
      if (state.selectedArenaIndex.value == -1) {
        return Helper.showToast(
          isSuccess: false,
          message: "Please choose arena first!",
        );
      }
    }
    if (state.selectedIndex.value == 3) {
      ArenaModel arenaModel =
          arenaDataSource.listArena[state.selectedArenaIndex.value];
      SessionModel sessionModel = SessionModel(
        arena: arenaModel,
        selectedCourt: state.selectedCourtIndex.value,
        dateTime: state.selectedDate,
        startHour: state.openTime.value,
        endHour: state.closeTime.value,
        totalHour: state.selectedHour.value,
        firstName: 'Ali',
        lastName: 'Qazwini',
        contactNumber: '',
        identificationNumber: '',
        price: 20,
      );

      videoPlayerController.pause();
      await Get.toNamed(
        CheckoutUi.namePath,
        arguments: [sessionModel, this],
      );
      videoPlayerController.play();
      return;
    }

    state.selectedIndex.value++;
  }

  void showCreateDialog() => PlayerAddSession(
        logic: this,
        state: state,
      ).createNewSession();

  PageController setController(PageController controller) =>
      state.pageController = controller;

  void inviteFriends(AvatarModel data) {
    data.isSelected.value = true;
    state.selectedFriends.add(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User added for invitation successfully',
    );
  }

  void removeInviteFriends(AvatarModel data) {
    data.isSelected.value = false;
    state.selectedFriends.remove(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User removed from card successfully',
    );
  }

  void showDetailSession(SessionModel data) {
    AdminSessionBottomSheet().successCreateSesssionSheet(
      arenaModel: data.arena,
      selectedCourt: data.selectedCourt,
      session: data,
      successCreate: false,
      showPill: true,
      onUpdate: () {
        Get.back();
        AdminAddSession(
          state: Get.find<SessionLogic>().state,
          logic: Get.find<SessionLogic>(),
        ).createNewSession();
      },
      onDelete: () {},
      isAdmin: false,
    );
  }

  void resetState() {
    state.selectedArenaIndex.value = -1;
    state.selectedCourtIndex.value = 0;
    state.selectedIndex.value = 1;
  }
}
