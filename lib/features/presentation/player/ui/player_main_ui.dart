// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/select_friend_item.dart';
import 'package:lawan/utility/shared/widgets/fields/field_session_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/bottom_navbar_item.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar_profile.dart';
import '../../../../utility/shared/widgets/navigations/custom_bottom_navbar.dart';
import '../../../../utility/shared/widgets/buttons/filter_button.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../utility/shared/widgets/video/video_widget.dart';

class PlayerMainUi extends StatelessWidget {
  static const String namePath = '/player_main_page';
  final logic = Get.find<PlayerMainLogic>();
  final state = Get.find<PlayerMainLogic>().state;
  PlayerMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget createSessionButton() {
      return Container(
        decoration: BoxDecoration(
          boxShadow: greenBoxShadow,
        ),
        child: GradientButton(
          onTap: logic.showCreateDialog,
          boxShadow: greenBoxShadow,
          widget: Obx(
            () => Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/play.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Create a session',
                  style: whiteTextStyle.copyWith(fontWeight: medium),
                ),
                if (state.selectedFriends.isNotEmpty) const SizedBox(width: 4),
                Visibility(
                  visible: state.selectedFriends.isNotEmpty,
                  child: TextBorder(
                    textTitle: '+${state.selectedFriends.length}',
                    fontSize: 11,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                    borderColor: Colors.transparent,
                    textColor: const Color(0xFF44D8BE),
                    backgroundColor: kWhiteColor,
                    gradient: mainGradient,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget customNavbar() {
      return Container(
        width: double.infinity,
        height: 183,
        padding: const EdgeInsets.only(top: 12),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => Visibility(
                visible: state.sessionList.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterButton(
                      paddingVertical: 12,
                      iconColor: kGreyColor,
                      textColor: kWhiteColor,
                      useBlur: true,
                    ),
                    SizedBox(width: defaultMargin),
                    createSessionButton(),
                  ],
                ),
              ),
            ),
            CustomBottomNavbar(
              useGradient: false,
              navbarItemWidget: Obx(
                () => Row(
                  children: state.listNavbarItem
                      .asMap()
                      .entries
                      .map(
                        (data) => Padding(
                          padding: EdgeInsets.only(
                            right: data.key != state.listNavbarItem.length - 1
                                ? 4
                                : 0,
                          ),
                          child: BottomNavbarItem(
                            title: data.value.name,
                            isActive:
                                state.selectedNavbarIndex.value == data.key,
                            icon: data.value.icon,
                            onTap: () =>
                                state.selectedNavbarIndex.value = data.key,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emptySession() {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: kBlackColor,
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: Get.height,
                  child:
                      const VideoWidget(url: 'assets/video/empty_session.mp4'),
                ),
                Container(
                  width: double.infinity,
                  height: Get.height,
                  color: kBlackColor.withOpacity(0.6),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/add_avatars.png',
                          width: 60,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'VS',
                          style: whiteTextStyle.copyWith(
                              fontSize: 10, fontWeight: bold),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/icons/add_avatars.png',
                          width: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: defaultMargin),
                    Text(
                      'No session available',
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    Text(
                      'Create a session to start playing',
                      style: greyTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createSessionButton(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: blackGradient,
            ),
          ),
        ],
      );
    }

    Widget inviteFriendSection() {
      return Obx(
        () => Visibility(
          visible: false,
          replacement: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CustomButton(
              isBlack: false,
              onTap: () {},
              borderColor: kGreyColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/add_user.svg',
                    color: kDarkgreyColor,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Find Friends',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: defaultMargin),
                  ...state.listFriends.map(
                    (data) => SelectFriendItem(
                      name: data.name,
                      asset: data.asset,
                      suffixWidget: data.isSelected.value
                          ? CircleButtonWidget(
                              onTap: () => logic.removeInviteFriends(data),
                              isActive: true,
                              widget: Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  'assets/icons/check.svg',
                                ),
                              ),
                              size: 36,
                            )
                          : CircleButtonTransparentWidget(
                              onTap: () => logic.inviteFriends(data),
                              size: 36,
                              widget: SvgPicture.asset(
                                'assets/icons/plus.svg',
                                color: kDarkgreyColor,
                              ),
                              borderColor: kGreyColor,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget sessionContentSection() {
      return Expanded(
        child: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: state.sessionList.isNotEmpty,
                replacement: emptySession(),
                child: ListView(
                  padding: EdgeInsets.all(defaultMargin),
                  children: [
                    ...state.sessionList.asMap().entries.map(
                          (data) => GestureDetector(
                            onTap: () => logic.showDetailSession(data.value),
                            child: FieldSessionWidget(
                              sessionModel: data.value,
                              showGameInformation:
                                  data.key == 0 || data.key == 1,
                            ),
                          ),
                        ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
              Visibility(
                visible: state.sessionList.isNotEmpty,
                child: Container(
                  width: double.infinity,
                  height: 16,
                  decoration: BoxDecoration(
                    gradient: whiteGradient,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.paddingOf(context).top),
                // appbar
                CustomAppbarProfile(
                  onTap: () => Get.offAndToNamed(AdminMainUi.namePath),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    // tabbar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TabbarWidget(
                        tabBarTitle: state.tabBarTitle,
                        tabActive: state.tabActive,
                        onTap: (title) {
                          state.tabActive.value = title;
                          logic.alignmentTabbar(title);
                        },
                        alignment: state.activeAlignment,
                      ),
                    ),
                    SizedBox(height: defaultMargin),

                    // friends list
                    inviteFriendSection(),
                    // available session
                    SizedBox(height: defaultMargin),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.only(left: defaultMargin),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kWhiteColor,
                          ),
                          child: Obx(
                            () => Text(
                              '${state.sessionList.length}',
                              style: blackTextStyle.copyWith(
                                  fontSize: 11, fontWeight: medium),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Available Session',
                          style: darkGreyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: state.sessionList.isEmpty,
                        child: SizedBox(height: defaultMargin),
                      ),
                    ),
                  ],
                ),

                // session content
                sessionContentSection(),
              ],
            ),

            // buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: customNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
