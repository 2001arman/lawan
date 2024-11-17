// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/lineup_ranked_logic.dart';
import 'package:lawan/features/presentation/lobby/widgets/lobby_selected_friend_widget.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/container/select_friend_item.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import 'dart:math' as math;

class LineupRankedUi extends StatefulWidget {
  const LineupRankedUi({super.key});

  @override
  State<LineupRankedUi> createState() => _LineupRankedUiState();
}

class _LineupRankedUiState extends State<LineupRankedUi>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<LineupRankedLogic>();
  final state = Get.find<LineupRankedLogic>().state;
  final lobbyState = Get.find<LineupRankedLogic>().lobbyState;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          const Duration(milliseconds: 400), // Set the duration of the rotation
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation({bool reverse = false}) {
    if (reverse) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Widget itemContent({
    required String position,
    required int index,
  }) {
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
                              ? lobbyState.isReferee
                                  ? 'Selected'
                                  : state.myProfile.name
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                margin: const EdgeInsets.only(left: 35),
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  position,
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

  Widget item(
      {double marginBottom = 0,
      double marginTop = 0,
      required String position,
      required int index}) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 68,
        margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
        child: itemContent(
          position: position,
          index: index,
        ),
      ),
    );
  }

  Widget playerSection() {
    return Stack(
      children: [
        Padding(
          key: state.keyField,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AspectRatio(
            aspectRatio: 363 / 867, // Approximately 0.4186
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,

                  transform: Matrix4.identity()
                    ..rotateZ(_controller.value * math.pi) // Rotate 180 degrees
                    ..scale(1.0,
                        -1.0), // Flip vertically to complete the perspective swap
                  child: child,
                );
              },
              child: SvgPicture.asset(
                'assets/icons/arena-football.svg',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),

        // player
        AspectRatio(
          aspectRatio: 363 / 867, // Approximately 0.4186
          child: LayoutBuilder(
            builder: (context, constraints) {
              final halfHeight =
                  (state.keyField.currentContext!.height / 2) + 14;
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: halfHeight,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 68,
                            child: itemContent(
                              position: 'GK',
                              index: 0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          item(
                            position: 'DF',
                            index: 1,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginBottom: 22,
                            position: 'DF',
                            index: 2,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginBottom: 22,
                            position: 'DF',
                            index: 3,
                          ),
                          const SizedBox(width: 12),
                          item(
                            position: 'DF',
                            index: 4,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          item(
                            position: 'MF',
                            index: 5,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginBottom: 22,
                            position: 'MF',
                            index: 6,
                          ),
                          const SizedBox(width: 12),
                          item(
                            position: 'MF',
                            index: 7,
                          ),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          item(
                            position: 'FW',
                            index: 8,
                          ),
                          const SizedBox(width: 12),
                          item(
                            marginTop: 22,
                            position: 'FW',
                            index: 9,
                          ),
                          const SizedBox(width: 12),
                          item(
                            position: 'FW',
                            index: 10,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Obx(
      () => lobbyState.lineUpTabActive.value == ''
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  ...state.selectedFriends.asMap().entries.map(
                        (data) => LobbySelectedFriendWidget(
                          onTap: () {},
                          isActive: false,
                          profile: data.value,
                          showReferee: (lobbyState.lineUpTabActive.value ==
                                  '') &&
                              (data.key != state.selectedRefereeIndex.value),
                          isReferee:
                              data.key == state.selectedRefereeIndex.value,
                          selecReferee: () => logic.selectReferee(
                              index: data.key, name: data.value.name),
                        ),
                      ),
                ],
              ),
            )
          : playerSection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                selectedWidth:
                    lobbyState.lineUpTabActive.value == '' ? 40 : null,
                tabBarTitle: lobbyState.lineUpTabBarTitle,
                tabActive: lobbyState.lineUpTabActive,
                iconSize: 20,
                onTap: (title) {
                  lobbyState.lineUpTabActive.value = title;
                  logic.alignmentTabbar(title);
                  if (title == 'Home') {
                    _startAnimation(reverse: true);
                    state.showTick.value = 0;
                  } else if (title == 'Away') {
                    _startAnimation(reverse: false);
                    state.showTick.value = 1;
                  }
                },
                alignment: lobbyState.lineUpActiveAlignment,
              ),
            ),
          ),

          // friendsList
          if (lobbyState.isReferee == false) SizedBox(height: defaultMargin),
          if (lobbyState.isReferee == false)
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

          // arena fields
          SizedBox(height: defaultMargin),
          body(),
          // const SizedBox(height: 200)
        ],
      ),
    );
  }
}
