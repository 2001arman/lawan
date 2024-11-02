// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/text/text_gradient.dart';

import '../../shared/widgets/text/text_border.dart';

class CustomDialogProfile {
  static Widget circularButtonIcon(String icon) {
    return CircleButtonTransparentWidget(
      onTap: () {},
      widget: Padding(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          icon,
          color: kWhiteColor,
        ),
      ),
    );
  }

  static Widget profilePicture() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: TextBorder(
            textTitle: 'Novice',
            backgroundColor: kWhiteColor,
            paddingVertical: 2,
            paddingHorizontal: 8,
            fontSize: 10,
            borderColor: kGreyColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 3,
                color: kBlackColor.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 5,
                color: kBlackColor.withOpacity(0.09),
              ),
            ],
          ),
          child: Image.asset(
            'assets/avatars/avatar1.png',
            width: 48,
            height: 48,
          ),
        ),
      ],
    );
  }

  static Widget profileSection() {
    return Column(
      children: [
        // profile section
        profilePicture(),
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
            onTap: () {},
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
            onTap: () {},
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

  static Widget modeSection() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () {},
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
            onTap: () {},
            paddingVertical: 12,
            radius: 20,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/arena.svg',
                  color: kWhiteColor,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  'Admin Mode',
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

  static void showDialogProfile() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          // height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kBackgroundColor,
          ),
          child: Stack(
            children: [
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
              Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    circularButtonIcon('assets/icons/bell.svg'),
                    circularButtonIcon('assets/icons/chevron-down.svg'),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                // height: Get.height,
                padding: EdgeInsets.all(defaultMargin),
                margin: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    profileSection(),
                    const SizedBox(height: 12),
                    settingAndProfileButton(),
                    const SizedBox(height: 12),
                    findAndRequestFriends(),
                    const SizedBox(height: 12),
                    modeSection(),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: defaultMargin),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
