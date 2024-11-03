// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/pages/lineup-ranked/lineup_ranked_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
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
          SizedBox(height: defaultMargin),

          // selected friends
          SizedBox(height: defaultMargin),
          Container(
            width: double.infinity,
            height: 867,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
