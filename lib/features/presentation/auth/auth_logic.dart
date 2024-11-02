import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_state.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_ui.dart';
import 'package:video_player/video_player.dart';

class AuthLogic extends GetxController {
  late VideoPlayerController videoPlayerController;
  final state = AuthState();

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(
        'assets/video/login.mp4',
        videoPlayerOptions: VideoPlayerOptions());
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
  }

  void handleTapOptionLogin(int index) {
    switch (index) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        state.loginPhone.toggle();
        break;
    }
  }

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Login':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        state.heightContainer.value = 442;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        state.heightContainer.value = 327;
        break;
    }
    return;
  }

  goToSecondScreen() async {
    videoPlayerController.pause();
    await Get.toNamed(AuthInformationUi.namePath);
    videoPlayerController.play();
  }
}
