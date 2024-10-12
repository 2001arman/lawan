import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup/controller/lineup_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/navigations/tab_bar_widget.dart';

class LineupUi extends StatelessWidget {
  final logic = Get.find<LineupLogic>();
  final state = Get.find<LineupLogic>().state;
  LineupUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
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
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: defaultMargin),
        TabbarWidget(
          tabBarTitle: state.tabBarTitle,
          tabActive: state.tabActive,
          onTap: (title) {
            state.tabActive.value = title;
            logic.alignmentTabbar(title);
          },
          alignment: state.activeAlignment,
        ),
      ],
    );
  }
}
