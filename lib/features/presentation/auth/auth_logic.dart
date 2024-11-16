// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_state.dart';
import 'package:lawan/features/presentation/auth/forgot-password/forgot_password_ui.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_ui.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';
import 'package:lawan/utility/shared/constants/global_variable.dart';
import 'package:video_player/video_player.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/buttons/custom_button.dart';

class AuthLogic extends GetxController {
  late VideoPlayerController videoPlayerController;
  final state = AuthState();

  final GlobalVariable _globalVariable = Get.find<GlobalVariable>();

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
    state.emailController.dispose();
    state.codeController.dispose();
    state.phoneController.dispose();
    state.passwordController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    state.emailController.dispose();
    state.codeController.dispose();
    state.phoneController.dispose();
    state.passwordController.dispose();
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

  void loginLogic() async {
    Get.offAllNamed(PlayerMainUi.namePath);
    _globalVariable.isLogin.value = true;
  }

  void showForgotPasswordDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 253,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 253,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: kModalColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -0.5),
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 0,
                  blurRadius: 0,
                  color: kBlackColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Reset password with',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  isBlack: true,
                  onTap: () => Get.toNamed(
                    ForgotPasswordUi.namePath,
                    arguments: [true],
                  ),
                  width: double.infinity,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/device-mobile.svg',
                        width: 16,
                        height: 16,
                        color: kWhiteColor,
                      ),
                      const SizedBox(width: 8),
                      Text('Phone Number', style: whiteTextStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  isBlack: true,
                  onTap: () => Get.toNamed(
                    ForgotPasswordUi.namePath,
                    arguments: [false],
                  ),
                  width: double.infinity,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/mail.svg',
                        width: 16,
                        height: 16,
                        color: kWhiteColor,
                      ),
                      const SizedBox(width: 8),
                      Text('Email', style: whiteTextStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  isBlack: false,
                  onTap: Get.back,
                  width: double.infinity,
                  title: 'Cancel',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
