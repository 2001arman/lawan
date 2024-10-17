import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:slide_to_act/slide_to_act.dart';

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

    Widget bottomSlideableBar() {
      return Obx(
        () => Visibility(
          visible: state.lobbyTabActive.value == 'Line-Up',
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                innerColor: kBlackColor,
                sliderButtonIcon: SvgPicture.asset('assets/icons/whistle.svg'),
                child: Visibility(
                  visible: state.lineUpTabActive.value != '',
                  replacement: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Referee mode',
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
                  ),
                  child: Padding(
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
                  ),
                ),
              ),
            ),
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
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top + defaultMargin,
              defaultMargin,
              defaultMargin,
            ),
            child: Column(
              children: [
                // appbar
                Row(
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

                // content body
                Expanded(
                  child: Obx(
                    () => body(),
                  ),
                ),
              ],
            ),
          ),
          bottomSlideableBar(),
        ],
      ),
    );
  }
}
