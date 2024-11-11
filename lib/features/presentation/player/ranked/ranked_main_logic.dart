import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/ranked/ranked_main_state.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';
import 'package:lawan/utility/util/helper_data.dart';
import 'package:video_player/video_player.dart';

import '../../../../utility/util/helper.dart';
import '../../../domain/session/avatar_model.dart';
import '../../../domain/session/session_model.dart';
import '../../admin/pages/session/admin_add_session.dart';
import '../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../admin/pages/session/session_logic.dart';
import '../player_main_state.dart';
import '../create-session/player_add_session.dart';

class RankedMainLogic extends GetxController {
  final PlayerMainState playerMainState = Get.find<PlayerMainState>();
  final RankedMainState state = RankedMainState();

  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    initVideo();
    state.listFriends.assignAll(HelperData.listFriends);
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

  void initVideo() {
    videoPlayerController = VideoPlayerController.asset(
      'assets/video/empty_session.mp4',
      videoPlayerOptions: VideoPlayerOptions(),
    );
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

  void onCreate(SessionModel session) async {
    state.sessionList.add(session);
    var data = state.listFriends.where((data) => data.isSelected.value == true);
    for (var friend in data) {
      friend.isSelected.value = false;
    }
    playerMainState.selectedFriends.clear();
    Get.close(2);
    await Future.delayed(const Duration(seconds: 1));
    AdminSessionBottomSheet().successCreateSesssionSheet(
      sessionType: SessionType.ranked,
      arenaModel: session.arena,
      selectedCourt: session.selectedCourt,
      session: session,
      showPill: true,
      successCreate: true,
      isAdmin: false,
      onUpdate: () {
        Get.back();
        AdminAddSession(
          state: Get.find<SessionLogic>().state,
          logic: Get.find<SessionLogic>(),
        ).createNewSession();
      },
      onDelete: () {},
    );
  }

  void showCreateDialog() => PlayerAddSession(
          onCreate: onCreate,
          selectedFriends: playerMainState.selectedFriends,
          sessionType: SessionType.ranked)
      .createNewSession();

  void inviteFriends(AvatarModel data) {
    data.isSelected.value = true;
    playerMainState.selectedFriends.add(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User added for invitation successfully',
    );
  }

  void removeInviteFriends(AvatarModel data) {
    data.isSelected.value = false;
    playerMainState.selectedFriends.remove(data);
    Helper.showToast(
      isSuccess: true,
      message: 'User removed from card successfully',
    );
  }

  void showDetailSession(SessionModel data) {
    AdminSessionBottomSheet().successCreateSesssionSheet(
      sessionType: SessionType.ranked,
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
}
