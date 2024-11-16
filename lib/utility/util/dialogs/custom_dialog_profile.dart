// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_ui.dart';
import 'package:lawan/features/presentation/player/payment/payment/add_card/payment_add_card_page.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';
import 'package:lawan/features/presentation/profile/feedback/feedback_ui.dart';
import 'package:lawan/features/presentation/profile/notifications/notifications_ui.dart';
import 'package:lawan/features/presentation/profile/qr-profile/qr_profile_ui.dart';
import 'package:lawan/features/presentation/referee/referee_ui.dart';
import 'package:lawan/features/presentation/settings/settings_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/constants/global_variable.dart';
import 'package:lawan/utility/shared/widgets/avatar_shadow_with_text.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';
import 'package:lawan/utility/shared/widgets/text/text_gradient.dart';

import '../../../features/presentation/profile/profile_ui.dart';
import '../../shared/constants/mode_type.dart';
import '../../shared/widgets/text/text_border.dart';

class CustomDialogProfile {
  static Widget circularButtonIcon(String icon, VoidCallback onTap) {
    return CircleButtonTransparentWidget(
      onTap: onTap,
      widget: Padding(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          icon,
          color: kWhiteColor,
        ),
      ),
    );
  }

  static Widget profileSection() {
    return Column(
      children: [
        // profile section
        const AvatarShadowWithText(),
        const SizedBox(height: 12),
        Text(
          'Jese Leos',
          style: blackTextStyle.copyWith(fontWeight: bold),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/stars.svg'),
            const SizedBox(width: 4),
            SvgPicture.asset('assets/icons/coin.svg'),
            const SizedBox(width: 4),
            TextGradient(
              gradient: goldGradient,
              textTitle: '1500',
              fontSize: 14,
              textColor: kGreenColor,
            )
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/malaysia.svg',
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'Gombak, Kuala Lumpur',
              style: darkGreyTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/icons/male.svg',
              width: 14,
              height: 14,
              color: kDarkgreyColor,
            ),
          ],
        ),
      ],
    );
  }

  static Widget settingAndProfileButton() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () {
              Get.back();
              Get.toNamed(SettingsUi.namePath);
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/settings.svg',
                  color: kWhiteColor,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Settings',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () => Get.toNamed(ProfileUi.namePath),
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/user.svg',
                  color: kWhiteColor,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Profile',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget findAndRequestFriends() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/add_user.svg',
                  color: kDarkgreyColor,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Find Friends',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/user-check.svg',
                  color: kDarkgreyColor,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Friend Request',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget modeSection({required ModeType source}) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () => Get.offAllNamed(RefereeUi.namePath),
            paddingVertical: 12,
            radius: 20,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/whistle.svg',
                  color: kWhiteColor,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  'Referee Mode',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    height: 14 / 14,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () {
              source == ModeType.player
                  ? Get.toNamed(
                      PaymentAddCardPage.namePath,
                      arguments: [
                        true,
                        true,
                      ],
                    )
                  : Get.offAllNamed(PlayerMainUi.namePath);
            },
            paddingVertical: 12,
            radius: 20,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  source == ModeType.player
                      ? 'assets/icons/arena.svg'
                      : 'assets/icons/play.svg',
                  color: kWhiteColor,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  source == ModeType.player ? 'Admin Mode' : 'Play Mode',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    height: 14 / 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget friendContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kGreyColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            'assets/avatars/avatar1.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'arman maulana',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                TextBorder(
                  textTitle: 'Novice',
                  backgroundColor: kWhiteColor,
                  fontSize: 10,
                  paddingVertical: 2,
                  paddingHorizontal: 8,
                )
              ],
            ),
          ),
          CircleButtonTransparentWidget(
            onTap: () {},
            widget: SvgPicture.asset(
              'assets/icons/chat.svg',
              color: kDarkgreyColor,
            ),
            borderColor: kGreyColor,
            size: 40,
          ),
          const SizedBox(width: 4),
          CircleButtonTransparentWidget(
            onTap: () {},
            widget: SvgPicture.asset(
              'assets/icons/plus.svg',
              color: kDarkgreyColor,
            ),
            borderColor: kGreyColor,
            size: 40,
          ),
        ],
      ),
    );
  }

  static Widget feedbackSection() {
    return GestureDetector(
      onTap: () => Get.toNamed(FeedbackUi.namePath),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kGreyColor),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/headset.svg',
              width: 24,
              height: 24,
              color: kDarkgreyColor,
            ),
            Text(
              'Give Feedback',
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }

  static void showDialogProfile({required ModeType source}) {
    final GlobalVariable global = Get.find<GlobalVariable>();
    if (global.isLogin.value == false) {
      return showLoginDialog();
    }
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: Get.height * 0.8,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: kBackgroundColor,
                ),
                child: Stack(
                  children: [
                    // gradient background
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        gradient: backgroundGradient,
                      ),
                    ),
                    // top action button
                    Padding(
                      padding: EdgeInsets.all(defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          circularButtonIcon(
                            'assets/icons/bell.svg',
                            () {
                              Get.back();
                              Get.toNamed(NotificationsUi.namePath);
                            },
                          ),
                          circularButtonIcon(
                            'assets/icons/chevron-up.svg',
                            Get.back,
                          ),
                        ],
                      ),
                    ),
                    // content
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(defaultMargin),
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          profileSection(),
                          const SizedBox(height: 12),
                          settingAndProfileButton(),
                          const SizedBox(height: 8),
                          findAndRequestFriends(),
                          Expanded(
                            child: Stack(
                              children: [
                                ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    friendContainer(),
                                    friendContainer(),
                                    friendContainer(),
                                    friendContainer(),
                                    friendContainer(),
                                    friendContainer(),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    gradient: whiteGradient,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      gradient: whiteGradientBottomToTop,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          modeSection(source: source),
                          const SizedBox(height: 12),
                          feedbackSection(),
                          SizedBox(height: defaultMargin),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GradientCircleButton(
                  onTap: () {
                    Get.back();
                    Get.toNamed(QrProfileUi.namePath);
                  },
                  size: 48,
                  widget: SvgPicture.asset('assets/icons/qrcode.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showLoginDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kBackgroundColor,
          ),
          child: Container(
            height: 184,
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: backgroundGradient,
            ),
            child: Stack(
              children: [
                // top action button
                Align(
                  alignment: Alignment.topRight,
                  child: circularButtonIcon(
                    'assets/icons/chevron-up.svg',
                    Get.back,
                  ),
                ),
                // content
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: defaultMargin),
                  margin: const EdgeInsets.only(top: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/logo.svg'),
                      SizedBox(height: defaultMargin),
                      Text(
                        'Pahlawan. Empowered.',
                        style: darkGreyTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              isBlack: true,
                              onTap: () => Get.toNamed(AuthUi.namePath),
                              title: 'Login',
                              paddingVertical: 11.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Or',
                              style: darkGreyTextStyle.copyWith(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            child: GradientButton(
                              onTap: () => Get.toNamed(AuthUi.namePath),
                              paddingVertical: 11.5,
                              widget: Text(
                                'Sign Up',
                                style:
                                    whiteTextStyle.copyWith(fontWeight: medium),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
