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

class LineupUi extends StatelessWidget {
  final logic = Get.find<LineupLogic>();
  final state = Get.find<LineupLogic>().state;
  final lobbyState = Get.find<LineupLogic>().lobbyState;
  LineupUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // score
            SizedBox(height: defaultMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Text(
                  '0',
                  style: blackTextStyle.copyWith(fontSize: 40),
                ),
                Text(
                  ':',
                  style: darkGreyTextStyle.copyWith(fontSize: 40),
                ),
                Text(
                  '0',
                  style: blackTextStyle.copyWith(fontSize: 40),
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

            // tabbar
            SizedBox(height: defaultMargin),
            Obx(
              () => TabbarWidget(
                tabBarIcon: const [null, 'assets/icons/whistle.svg', null],
                selectedWidth:
                    lobbyState.lineUpTabActive.value == '' ? 40 : null,
                tabBarTitle: lobbyState.lineUpTabBarTitle,
                tabActive: lobbyState.lineUpTabActive,
                iconSize: 20,
                onTap: (title) {
                  lobbyState.lineUpTabActive.value = title;
                  logic.alignmentTabbar(title);
                },
                alignment: lobbyState.lineUpActiveAlignment,
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
                        children: state.listFriends
                            .map(
                              (data) => SelectFriendItem(
                                name: data.name,
                                asset: data.asset,
                                suffixWidget: CircleButtonTransparentWidget(
                                  onTap: () {
                                    state.selectedFriends.add(data);
                                    state.listFriends.remove(data);
                                  },
                                  size: 36,
                                  widget: Icon(
                                    Icons.add,
                                    color: kDarkgreyColor,
                                  ),
                                  borderColor: kGreyColor,
                                ),
                              ),
                            )
                            .toList(),
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
                  padding: EdgeInsets.zero,
                  children: state.selectedFriends
                      .map(
                        (data) => Container(
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
                                            padding:
                                                const EdgeInsets.only(right: 3),
                                            child: SvgPicture.asset(
                                                'assets/icons/user.svg'),
                                          ),
                                          title: data.position,
                                          titleColor: kBlackColor,
                                        ),
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
                                  visible:
                                      lobbyState.lineUpTabActive.value == '',
                                  child: CircleButtonTransparentWidget(
                                    onTap: () {},
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
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
