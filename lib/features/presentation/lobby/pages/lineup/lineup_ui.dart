// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup/controller/lineup_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../utility/shared/widgets/container/select_friend_item.dart';
import '../../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../../utility/shared/widgets/text/text_border.dart';
import '../../../../../utility/shared/widgets/text/text_pill_widget.dart';
import '../../../../domain/session/avatar_model.dart';

class LineupUi extends StatelessWidget {
  final logic = Get.find<LineupLogic>();
  final state = Get.find<LineupLogic>().state;
  final lobbyState = Get.find<LineupLogic>().lobbyState;
  LineupUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget selectedFriends({required AvatarModel data, required int index}) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Image.asset(
              data.asset,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextPillWidget(
                        verticalPadding: 2,
                        backgroundColor: kBackgroundColor,
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: SvgPicture.asset('assets/icons/user.svg'),
                        ),
                        title: data.position,
                        titleColor: kBlackColor,
                      ),
                      const SizedBox(width: 8),
                      Visibility(
                        visible: index == state.selectedRefereeIndex.value,
                        child: SvgPicture.asset(
                          'assets/icons/whistle.svg',
                          color: kBlackColor,
                          width: 16,
                          height: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            TextBorder(
              textTitle: 'Novice',
              backgroundColor: kWhiteColor,
              fontSize: 10,
            ),
            Obx(
              () => Visibility(
                visible: (lobbyState.lineUpTabActive.value == '') &&
                    (index != state.selectedRefereeIndex.value),
                child: CircleButtonTransparentWidget(
                  onTap: () => logic.selectReferee(
                    index: index,
                    name: data.name,
                  ),
                  borderColor: kGreyColor,
                  margin: const EdgeInsets.only(left: 12),
                  widget: SvgPicture.asset(
                    'assets/icons/whistle.svg',
                    color: kBlackColor,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      );
    }

    Widget invitedFriend({required AvatarModel data}) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          // color: kWhiteColor,
          border: Border.all(width: 1, color: kWhiteColor),
        ),
        child: Row(
          children: [
            Image.asset(
              data.asset,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Invitation sent. Waiting for player to join.',
                    style: darkGreyTextStyle.copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
            TextBorder(
              textTitle: 'Novice',
              backgroundColor: kWhiteColor,
              fontSize: 10,
            ),
          ],
        ),
      );
    }

    Widget availableSlot() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          // color: kWhiteColor,
          border: Border.all(width: 1, color: kWhiteColor),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kMidgreyColor,
              ),
              child: SvgPicture.asset(
                'assets/icons/add_user.svg',
                color: kWhiteColor,
              ),
            ),
            const Spacer(),
            TextBorder(
              textTitle: 'Available slot',
              backgroundColor: kWhiteColor,
              fontSize: 10,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // score
        SizedBox(height: defaultMargin),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset('assets/icons/home_shield.svg'),
                          const SizedBox(height: 8),
                          Text(
                            'Home',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                        ],
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 6,
                          ),
                          child: state.showTick.value == 0
                              ? SvgPicture.asset(
                                  'assets/icons/check-circle.svg')
                              : const SizedBox(width: 16),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '0',
                    style: blackTextStyle.copyWith(fontSize: 40),
                  ),
                ],
              ),
            ),
            Text(
              ':',
              style: darkGreyTextStyle.copyWith(fontSize: 40),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '0',
                    style: blackTextStyle.copyWith(fontSize: 40),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            right: 6,
                          ),
                          child: state.showTick.value == 1
                              ? SvgPicture.asset(
                                  'assets/icons/check-circle.svg')
                              : const SizedBox(width: 16),
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset('assets/icons/away_shield.svg'),
                          const SizedBox(height: 8),
                          Text(
                            'Away',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),

        // tabbar
        SizedBox(height: defaultMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Obx(
            () => TabbarWidget(
              tabBarIcon: const [null, 'assets/icons/whistle.svg', null],
              selectedWidth: lobbyState.lineUpTabActive.value == '' ? 40 : null,
              tabBarTitle: lobbyState.lineUpTabBarTitle,
              tabActive: lobbyState.lineUpTabActive,
              iconSize: 20,
              onTap: (title) {
                lobbyState.lineUpTabActive.value = title;
                logic.alignmentTabbar(title);
                if (title == 'Home') {
                  state.showTick.value = 0;
                } else if (title == 'Away') {
                  state.showTick.value = 1;
                }
              },
              alignment: lobbyState.lineUpActiveAlignment,
            ),
          ),
        ),

        // friendsList
        SizedBox(height: defaultMargin),
        Obx(
          () => Visibility(
            visible: lobbyState.lineUpTabActive.value != '',
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: defaultMargin),
                      ...state.listFriends.map(
                        (data) => SelectFriendItem(
                          name: data.name,
                          asset: data.asset,
                          suffixWidget: CircleButtonTransparentWidget(
                            onTap: () => logic.addInviteFriend(data),
                            size: 36,
                            widget: SvgPicture.asset(
                              'assets/icons/plus.svg',
                              color: kDarkgreyColor,
                            ),
                            borderColor: kGreyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // selected friends
        SizedBox(height: defaultMargin),
        Obx(
          () => Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                ...state.selectedFriends.asMap().entries.map(
                      (data) => data.key > 1
                          ? invitedFriend(data: data.value)
                          : selectedFriends(data: data.value, index: data.key),
                    ),
                for (int i = 0; i < state.availableSlot.value; i++)
                  availableSlot()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
