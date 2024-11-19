// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/badminton_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/football_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/basketball_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/futsal_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/martial_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/pickleball_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/rugby_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/takraw_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/tennis_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/arenas/volley_arena_widget.dart';
import 'package:lawan/features/presentation/lobby/lineup-ranked/lineup_ranked_logic.dart';
import 'package:lawan/features/presentation/lobby/widgets/lobby_selected_friend_widget.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/constants/global_variable.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/container/select_friend_item.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';

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
  final _globalVariable = Get.find<GlobalVariable>();
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

  void _startAnimation({bool reverse = false}) {
    if (reverse) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Widget arenaWidget() {
    switch (_globalVariable.selectedSport.value!.id) {
      case 1:
        return BadmintonArenaWidget(controller: _controller);
      case 2:
        return BasketballArenaWidget(controller: _controller);
      case 3:
        return FutsalArenaWidget(controller: _controller);
      case 4:
        return FutsalArenaWidget(controller: _controller);
      case 5:
        return MartialArenaWidget(controller: _controller);
      case 6:
        return PickleballArenaWidget(controller: _controller);
      case 7:
        return RugbyArenaWidget(controller: _controller);
      case 8:
        return FootballArenaWidget(controller: _controller);
      case 9:
        return TakrawArenaWidget(controller: _controller);
      case 10:
        return TennisArenaWidget(controller: _controller);
      case 11:
        return VolleyArenaWidget(controller: _controller);
      default:
        return FootballArenaWidget(controller: _controller);
    }
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
          : arenaWidget(),
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
