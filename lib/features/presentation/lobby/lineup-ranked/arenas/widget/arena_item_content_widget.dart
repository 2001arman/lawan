// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../utility/shared/constants/constants_ui.dart';
import '../../lineup_ranked_logic.dart';

class ArenaItemContentWidget extends StatelessWidget {
  final logic = Get.find<LineupRankedLogic>();
  final state = Get.find<LineupRankedLogic>().state;
  final lobbyState = Get.find<LineupRankedLogic>().lobbyState;
  final int index;
  final String? position;
  ArenaItemContentWidget({
    super.key,
    required this.index,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => logic.handleselectedPlayerIndex(index),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: logic.getProfilePosition(index) != null
                            ? kBlackColor
                            : kWhiteColor,
                        gradient: lobbyState.selectedPlayerIndex.value == index
                            ? mainGradient
                            : null,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-2, 1),
                            blurRadius: 5,
                            color: kBlackColor.withOpacity(0.1),
                          ),
                          BoxShadow(
                            offset: const Offset(-8, 3),
                            blurRadius: 9,
                            color: kBlackColor.withOpacity(0.09),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          lobbyState.selectedPlayerIndex.value == index
                              ? 'Selected'
                              : logic.getProfilePosition(index)?.name ??
                                  'Available',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                            color: !lobbyState.isReferee &&
                                        lobbyState.selectedPlayerIndex.value ==
                                            index ||
                                    logic.getProfilePosition(index) != null
                                ? kWhiteColor
                                : kBlackColor,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 3,
                        color: kBlackColor.withOpacity(0.1),
                      ),
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: kBlackColor.withOpacity(0.09),
                      ),
                    ],
                  ),
                  child: lobbyState.selectedPlayerIndex.value == index ||
                          logic.getProfilePosition(index) != null
                      ? Image.asset(
                          !lobbyState.isReferee &&
                                  lobbyState.selectedPlayerIndex.value == index
                              ? state.myProfile.asset
                              : logic.getProfilePosition(index)!.asset,
                          width: 40,
                          height: 40,
                        )
                      : Center(
                          child: SvgPicture.asset(
                            'assets/icons/add_user.svg',
                            width: 20,
                            height: 20,
                            color: kMidgreyColor,
                          ),
                        ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (position != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  margin: const EdgeInsets.only(left: 35),
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    position!,
                    style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: medium,
                      height: 16 / 10,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
