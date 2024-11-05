import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/ranked/ranked_main_logic.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../widgets/player_empty_session.dart';
import '../widgets/player_invite_friend_section.dart';
import '../widgets/player_session_content_section.dart';

class RankedMainUi extends StatelessWidget {
  final logic = Get.find<RankedMainLogic>();
  final state = Get.find<RankedMainLogic>().state;
  RankedMainUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget inviteFriendSection() {
      return PlayerInviteFriendSection(
        listFriends: state.listFriends,
        onRemoveFriend: (data) => logic.removeInviteFriends(data),
        onAddFriend: (data) => logic.inviteFriends(data),
      );
    }

    Widget emptySession() {
      return PlayerEmptySession(
        videoPlayerController: logic.videoPlayerController,
        onTap: logic.showCreateDialog,
        selectedFriends: logic.playerMainState.selectedFriends,
      );
    }

    Widget sessionContentSection() {
      return PlayerSessionContentSection(
        emptySessionWidget: emptySession(),
        sessionList: state.sessionList,
        showDetailSession: (data) => logic.showDetailSession(data),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 100),
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
                  style:
                      blackTextStyle.copyWith(fontSize: 11, fontWeight: medium),
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
        // session content
        sessionContentSection(),
      ],
    );
  }
}
