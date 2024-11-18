// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/lineup_ranked_ui.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/buttons/filter_button.dart';
import '../../../utility/shared/widgets/navigations/custom_bottom_navbar.dart';
import '../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import 'lobby_controller.dart';
import 'chat/chat_ui.dart';
import 'lineup-friendly/lineup_friendly_ui.dart';

class LobbyUi extends StatelessWidget {
  static const String namePath = '/lobby_page';
  final logic = Get.find<LobbyController>();
  final state = Get.find<LobbyController>().state;
  LobbyUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (state.lobbyTabActive.value) {
        case 'Line-Up':
          return logic.sessionType == SessionType.friendly
              ? LineupFriendlyUi()
              : const LineupRankedUi();
        default:
          return ChatUi();
      }
    }

    Widget contentSlide(String title) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: defaultMargin),
              child: SvgPicture.asset(
                'assets/icons/arrow_right_3.svg',
              ),
            ),
          ),
        ],
      );
    }

    Widget sessionStartSlide() {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sesssion starting in',
              style: darkGreyTextStyle.copyWith(fontSize: 12),
            ),
            Text(
              '2 days 2 hours 6 mins 3 sec ',
              style: blackTextStyle.copyWith(fontWeight: bold),
            ),
          ],
        ),
      );
    }

    Widget bottomSlideableBar() {
      return Container(
        width: double.infinity,
        height: 120,
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          12,
          defaultMargin,
          Platform.isIOS ? MediaQuery.of(context).padding.bottom : 12,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kBlackColor.withOpacity(0),
              kBlackColor.withOpacity(0.3),
            ],
          ),
        ),
        child: SlideAction(
          alignment: Alignment.bottomCenter,
          height: 68,
          outerColor: const Color(0xFFE5E6E5),
          elevation: 0,
          onSubmit: logic.handleSlideLogic,
          innerColor: kBlackColor,
          sliderButtonMargin: const EdgeInsets.only(left: 8),
          gradient: logic.sessionType == SessionType.ranked && !state.isReferee
              ? mainGradient
              : null,
          sliderButtonIcon: SvgPicture.asset(
            logic.sessionType == SessionType.ranked && !state.isReferee
                ? 'assets/icons/player-play.svg'
                : 'assets/icons/whistle.svg',
            width: 24,
            height: 24,
            color: kWhiteColor,
          ),
          child: Visibility(
            visible: state.lineUpTabActive.value != '',
            replacement: contentSlide('Referee mode'),
            child: logic.sessionType == SessionType.ranked && !state.isReferee
                ? contentSlide(state.selectedPlayerIndex.value != -1
                    ? 'Swipe to Join Session'
                    : 'Select position to play')
                : sessionStartSlide(),
          ),
        ),
      );
    }

    Widget bottomBarStarting() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
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
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterButton(
                      paddingVertical: 12,
                      iconColor: kGreyColor,
                      textColor: kWhiteColor,
                      useBlur: true,
                    ),
                  ],
                ),
                CustomBottomNavbar(
                  useGradient: false,
                  navbarItemWidget: Row(
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
                            child: GradientCircleButton(
                              gradient: data.value.gradient,
                              size: 60,
                              widget: Column(
                                children: [
                                  SvgPicture.asset(
                                    data.value.icon,
                                    width: 16,
                                    height: 16,
                                    color: kWhiteColor,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    data.value.name,
                                    style: blackTextStyle.copyWith(
                                      color: kWhiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 15.66 / 12,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () =>
                                  logic.handleSelectedAction(data.value),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: Platform.isIOS
                      ? MediaQuery.of(context).padding.bottom
                      : 12,
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget bottomActiveSlideableBar() {
      return Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          12,
          defaultMargin,
          Platform.isIOS ? MediaQuery.of(context).padding.bottom : 12,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kBlackColor.withOpacity(0),
              kBlackColor.withOpacity(0.3),
            ],
          ),
        ),
        child: SlideAction(
          alignment: Alignment.bottomCenter,
          height: 68,
          outerColor: const Color(0xFFE5E6E5),
          elevation: 0,
          onSubmit: logic.handleSlideAction,
          innerColor: kBlackColor,
          gradient: state.selectedAction.value!.activeGradient,
          sliderButtonIconPadding: 14,
          sliderButtonMargin: const EdgeInsets.only(left: 8),
          sliderButtonIcon: Column(
            children: [
              SvgPicture.asset(
                state.selectedAction.value!.icon,
                width: 16,
                height: 16,
                color: kWhiteColor,
              ),
              const SizedBox(height: 4),
              Text(
                state.selectedAction.value!.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          child: Visibility(
            visible: state.lineUpTabActive.value != '',
            child: contentSlide('Swipe to update'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Obx(
            () => Container(
              width: Get.width,
              height: Get.height *
                  (state.lobbyTabActive.value == 'Chat' ? 0.7 : 0.3),
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + defaultMargin,
              bottom: defaultMargin,
            ),
            child: Column(
              children: [
                // appbar
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    defaultMargin,
                    0,
                    defaultMargin,
                    defaultMargin,
                  ),
                  child: Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: Get.back,
                        widget: SvgPicture.asset('assets/icons/back.svg'),
                        margin: const EdgeInsets.only(right: 8),
                      ),
                      Expanded(
                        child: TabbarWidget(
                          tabBarTitle: state.lobbyTabBarTitle,
                          tabBarIcon: state.lobbyTabBarIcon,
                          tabActive: state.lobbyTabActive,
                          backgroundColor: kBlackColor,
                          onTap: (title) {
                            state.lobbyTabActive.value = title;
                            logic.lobbyAlignmentTabbar(title);
                          },
                          alignment: state.lobbyActiveAlignment,
                        ),
                      ),
                    ],
                  ),
                ),

                // content body
                Expanded(
                  child: Obx(
                    () => body(),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: state.lobbyTabActive.value == 'Line-Up',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: state.isStarting.value,
                  replacement: bottomSlideableBar(),
                  child: state.selectedAction.value != null
                      ? bottomActiveSlideableBar()
                      : bottomBarStarting(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
