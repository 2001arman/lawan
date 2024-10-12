import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../controller/lobby_controller.dart';
import 'chat/chat_ui.dart';
import 'lineup/lineup_ui.dart';

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
          return LineupUi();
        default:
          return ChatUi();
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
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
              padding: EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  // appbar
                  Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: () {},
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

                  // content body
                  Obx(() => body())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
