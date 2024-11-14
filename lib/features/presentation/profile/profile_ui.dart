// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/profile_logic.dart';
import 'package:lawan/features/presentation/profile/widgets/session_section.dart';
import 'package:lawan/features/presentation/profile/widgets/statistic_section.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/constants/mode_type.dart';
import '../../../utility/shared/widgets/avatar_shadow_with_text.dart';
import '../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../utility/shared/widgets/navigations/custom_appbar_profile.dart';
import '../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../utility/util/dialogs/custom_dialog_profile.dart';

class ProfileUi extends StatelessWidget {
  static const String namePath = '/profile_page';
  final logic = Get.find<ProfileLogic>();
  final state = Get.find<ProfileLogic>().state;
  ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget circularButtonIcon(
      String icon, {
      Color? color,
    }) {
      return CircleButtonTransparentWidget(
        onTap: () {},
        size: 44,
        widget: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
      );
    }

    Widget detailProfileSection() {
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
          SvgPicture.asset('assets/icons/stars.svg'),
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

    Widget settingAndProfileButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circularButtonIcon('assets/icons/pencil.svg', color: kDarkgreyColor),
          const SizedBox(width: 8),
          circularButtonIcon('assets/icons/pencil.svg', color: kDarkgreyColor),
          const SizedBox(width: 8),
          circularButtonIcon('assets/icons/pencil.svg', color: kDarkgreyColor),
        ],
      );
    }

    Widget profileSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + 58 + defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kModalColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                circularButtonIcon(
                  'assets/icons/back.svg',
                  color: kDarkgreyColor,
                ),
                const SizedBox(width: 8),
                Text(
                  '1255 views',
                  style: darkGreyTextStyle.copyWith(fontSize: 10),
                ),
                const Spacer(),
                Text(
                  '1255 likes',
                  style: darkGreyTextStyle.copyWith(fontSize: 10),
                ),
                const SizedBox(width: 8),
                circularButtonIcon('assets/icons/heart.svg'),
              ],
            ),

            // content
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  detailProfileSection(),
                  const SizedBox(height: 12),
                  settingAndProfileButton(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget clubAndPosition() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 66,
              child: CustomButton(
                isBlack: false,
                onTap: () {},
                paddingVertical: 12,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/club-arsenal.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Arsenal FC',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                backgroundColor: kWhiteColor,
              ),
            ),
          ),
          SizedBox(width: defaultMargin),
          Expanded(
            child: SizedBox(
              height: 66,
              child: CustomButton(
                isBlack: false,
                onTap: () {},
                paddingVertical: 12,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: kDarkgreyColor,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Arsenal FC',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                backgroundColor: kWhiteColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget body() {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          0,
        ),
        child: Column(
          children: [
            profileSection(),
            SizedBox(height: defaultMargin),
            clubAndPosition(),
            SizedBox(height: defaultMargin),
            // tabbar session
            TabbarWidget(
              tabBarTitle: state.lobbyTabBarTitle,
              tabActive: state.lobbyTabActive,
              backgroundColor: kGreyColor,
              onTap: (title) {
                state.lobbyTabActive.value = title;
                              logic.lobbyAlignmentTabbar(title);
              },
              alignment: state.lobbyActiveAlignment,
            ),

            // content
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Obx(
                      () => ListView(
                        padding: EdgeInsets.only(top: defaultMargin),
                        children: [
                          state.lobbyTabActive.value == 'Sessions'
                              ? const SessionSection()
                              : const StatisticSection()
                        ],
                      ),
                    ),
                  ),
                  const HorizontalWhiteGradient(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
          body(),
          // appbar
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
            child: CustomAppbarProfile(
              onTap: () => CustomDialogProfile.showDialogProfile(
                source: ModeType.player,
              ),
            ),
          ),
          // buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kBlackColor.withOpacity(0),
                    kBlackColor.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
