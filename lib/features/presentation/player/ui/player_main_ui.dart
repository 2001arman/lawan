// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/club/club_ui.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';
import 'package:lawan/features/presentation/player/friendly/friendly_main_ui.dart';
import 'package:lawan/features/presentation/player/leaderboard/leaderboard_ui.dart';
import 'package:lawan/features/presentation/player/ranked/ranked_main_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/create_session_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/constants/mode_type.dart';
import '../../../../utility/shared/widgets/bottom_navbar_item.dart';
import '../../../../utility/shared/widgets/buttons/filter_button.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar_profile.dart';
import '../../../../utility/shared/widgets/navigations/custom_bottom_navbar.dart';
import '../../../../utility/util/dialogs/custom_dialog_profile.dart';

class PlayerMainUi extends StatelessWidget {
  static const String namePath = '/player_main_page';
  final logic = Get.find<PlayerMainLogic>();
  final state = Get.find<PlayerMainLogic>().state;
  PlayerMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget addsOnButton() {
      switch (state.selectedNavbarIndex.value) {
        case 0:
          return Visibility(
            visible: logic.friendlyMainState.sessionList.isNotEmpty,
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
                CreateSessionButton(
                  onTap: logic.friendlyMainLogic.showCreateDialog,
                  selectedFriends: logic.state.selectedFriends,
                ),
              ],
            ),
          );
        case 1:
          return Visibility(
            visible: logic.rankedlyMainLogic.state.sessionList.isNotEmpty,
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
                CreateSessionButton(
                  onTap: logic.rankedlyMainLogic.showCreateDialog,
                  selectedFriends: state.selectedFriends,
                ),
              ],
            ),
          );
        case 3:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterButton(
                paddingVertical: 12,
                iconColor: kGreyColor,
                textColor: kWhiteColor,
                useBlur: true,
                fromLeaderBoard: true,
              ),
              SizedBox(width: defaultMargin),
              Container(
                decoration: BoxDecoration(
                  boxShadow: greenBoxShadow,
                ),
                child: CustomButton(
                  isBlack: true,
                  paddingVertical: 12,
                  paddingHorizontal: defaultMargin,
                  onTap: logic.leaderboardLogic.state.showStarMode.toggle,
                  widget: Row(
                    children: [
                      SvgPicture.asset('assets/icons/rotate.svg'),
                      const SizedBox(width: 4),
                      Text(
                        'By Rank',
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        default:
          return const SizedBox();
      }
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
              () => addsOnButton(),
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
                            onTap: () => logic.changeIndex(data.key),
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

    Widget body() {
      switch (state.selectedNavbarIndex.value) {
        case 0:
          return FriendlyMainUi();
        case 1:
          return RankedMainUi();
        case 2:
          return ClubUi();
        case 3:
          return const LeaderboardUi();
        default:
          return const Center(
            child: Text('other'),
          );
      }
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
                Expanded(
                  child: Obx(
                    () => body(),
                  ),
                ),
              ],
            ),
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
              child: customNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
