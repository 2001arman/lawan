import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/widgets/lobby_referee_item_widget.dart';
import 'package:lawan/features/presentation/profile/lineup/lineup_logic.dart';
import 'package:lawan/features/presentation/profile/widgets/home_away_score_widget.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../domain/session/avatar_model.dart';
import '../../lobby/widgets/lobby_selected_friend_widget.dart';

class LineupUi extends StatelessWidget {
  static const String namePath = '/lineup_page';
  final logic = Get.find<LineupLogic>();
  final state = Get.find<LineupLogic>().state;
  LineupUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget selectedFriends({
      required AvatarModel data,
      required int index,
    }) {
      return LobbySelectedFriendWidget(
        isActive: false,
        profile: data,
        showReferee: false,
        isReferee: index == 0,
        selecReferee: () {},
        onTap: () {},
      );
    }

    Widget selectedReferee({
      required AvatarModel data,
    }) {
      return LobbyRefereeItemWidget(
        profile: data,
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.3,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top,
              defaultMargin,
              0,
            ),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Line-Up',
                  prefixIcon: 'assets/icons/users_group.svg',
                  prefixColor: kGreyColor,
                  iconColor: kWhiteColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                SizedBox(height: defaultMargin),
                const HomeAwayScoreWidget(),
                SizedBox(height: defaultMargin),
                Obx(
                  () => TabbarWidget(
                    tabBarIcon: const [null, 'assets/icons/whistle.svg', null],
                    selectedWidth:
                        state.lineUpTabActive.value == '' ? 40 : null,
                    tabBarTitle: state.lineUpTabBarTitle,
                    tabActive: state.lineUpTabActive,
                    iconSize: 20,
                    onTap: (title) {
                      state.lineUpTabActive.value = title;
                      logic.alignmentTabbar(title);
                    },
                    alignment: state.lineUpActiveAlignment,
                  ),
                ),

                // list Player
                SizedBox(height: defaultMargin),
                Obx(
                  () => Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: state.lineUpTabActive.value != ''
                          ? [
                              for (int i = 0; i < 5; i++)
                                ...state.selectedFriends.asMap().entries.map(
                                      (data) => selectedFriends(
                                          data: data.value, index: data.key),
                                    ),
                            ]
                          : [
                              selectedReferee(
                                data: state.selectedFriends[0],
                              ),
                            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
