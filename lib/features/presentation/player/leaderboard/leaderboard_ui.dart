import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/leaderboard/leaderboard_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/navigations/leaderboard_tabbar_widget.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';
import 'package:lawan/utility/shared/widgets/text/text_gradient.dart';
import 'package:sliver_app_bar_builder/sliver_app_bar_builder.dart';

import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';

class LeaderboardUi extends StatefulWidget {
  const LeaderboardUi({super.key});

  @override
  State<LeaderboardUi> createState() => _LeaderboardUiState();
}

class _LeaderboardUiState extends State<LeaderboardUi> {
  final logic = Get.find<LeaderboardLogic>();

  final state = Get.find<LeaderboardLogic>().state;
  late ScrollController _scrollController;
  late ScrollController _listViewController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _listViewController = ScrollController();
    // _scrollController.addListener(_scrollListener);
    // _listViewController.addListener(_scrollListenerListView);
  }

  // void _scrollListener() {
  //   if (_scrollController.offset > 150) {
  //     _listViewController.jumpTo(2);
  //   } else {
  //     _listViewController.jumpTo(0);
  //   }
  // }

  // void _scrollListenerListView() {
  //   if (_listViewController.position.pixels > 0) {
  //     state.activeScroll.value = true;
  //   } else {
  //     state.activeScroll.value = false;
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget playerWeekContainer() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                state.lobbyTabActive.value == 'Club'
                    ? 'assets/icons/club-arsenal.png'
                    : 'assets/avatars/avatar1.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saiful Bukhari',
                    style: blackTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                    ),
                  ),
                  state.lobbyTabActive.value == 'Club'
                      ? Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              const TextBorder(
                                textTitle: 'Grassroots',
                                paddingHorizontal: 6,
                                paddingVertical: 0,
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                'assets/icons/gradient-arrow-circle-up.svg',
                              ),
                            ],
                          ),
                        )
                      : TextGradient(
                          gradient: mainGradient,
                          textTitle: '2 Goals',
                          fontSize: 12,
                          textColor: kGreenColor,
                        ),
                ],
              )
            ],
          ),
        ),
      );
    }

    LinearGradient? handleGradienti(int number) {
      if (number == 1) {
        return goldGradient;
      } else if (number == 2) {
        return silverGradient;
      } else if (number == 3) {
        return bronzeGradient;
      } else {
        return null;
      }
    }

    Widget numberSection() {
      return Column(
        children: [
          Row(
            children: [
              TextGradient(
                gradient: mainGradient,
                textTitle: 'Goal',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
              const Spacer(),
              TextGradient(
                gradient: mainGradient,
                textTitle: '3',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
            ],
          ),
          Row(
            children: [
              TextGradient(
                gradient: mainGradient,
                textTitle: 'Assist',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
              const Spacer(),
              TextGradient(
                gradient: mainGradient,
                textTitle: '6',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
            ],
          ),
          Row(
            children: [
              TextGradient(
                gradient: mainGradient,
                textTitle: 'Save',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
              const Spacer(),
              TextGradient(
                gradient: mainGradient,
                textTitle: '0',
                fontSize: 11,
                textColor: kGreenColor,
                lineHeight: 16 / 11,
              ),
            ],
          ),
        ],
      );
    }

    Widget leaderboardItem({
      bool useShadow = false,
      double paddingVertical = 0,
      double height = 66,
      double marginTop = 12,
      required int number,
    }) {
      return Container(
        width: double.infinity,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: paddingVertical,
        ),
        margin: EdgeInsets.only(top: marginTop),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
          boxShadow: useShadow
              ? [
                  BoxShadow(
                    offset: const Offset(0, -3),
                    blurRadius: 7,
                    color: kBlackColor.withOpacity(0.1),
                  ),
                  BoxShadow(
                    offset: const Offset(0, -13),
                    blurRadius: 13,
                    color: kBlackColor.withOpacity(0.09),
                  ),
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBlackColor,
                gradient: handleGradienti(number),
              ),
              child: Center(
                child: Text(
                  number == -1 ? 'N/A' : '$number',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
            SizedBox(width: defaultMargin),
            Obx(
              () => Image.asset(
                state.lobbyTabActive.value == 'Club'
                    ? 'assets/icons/club-arsenal.png'
                    : 'assets/avatars/avatar2.png',
                width: 48,
                height: 48,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jese Leos',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => TextBorder(
                      textTitle: state.lobbyTabActive.value == 'Club'
                          ? 'World Class'
                          : 'Novice',
                      paddingVertical: 0,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 88,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFF23A991).withOpacity(0.08),
                    ),
                  ),
                  child: Obx(
                    () => state.showStarMode.value
                        ? Column(
                            children: [
                              SvgPicture.asset(useShadow
                                  ? 'assets/icons/stars.svg'
                                  : 'assets/icons/star.svg'),
                              Visibility(
                                visible: useShadow == false,
                                child: TextGradient(
                                  gradient: mainGradient,
                                  textTitle: '21300',
                                  fontSize: 11,
                                  textColor: kGreenColor,
                                ),
                              ),
                            ],
                          )
                        : numberSection(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(
          bottom: 150,
          top: 58 + MediaQuery.of(context).padding.top,
        ),
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Collapsible Tabbar and Player of the Week section
                  SliverAppBarBuilder(
                    initialContentHeight: Platform.isIOS ? 115 : 140,
                    pinned: false,
                    stretch: false,
                    contentBelowBar: false,
                    barHeight: 0,
                    contentPadding: EdgeInsets.zero,
                    trailingActionsPadding: EdgeInsets.zero,
                    leadingActionsPadding: EdgeInsets.zero,
                    backgroundColorAll: Colors.transparent,
                    contentBuilder: (context, expandRatio, contentHeight,
                            centerPadding, overlapsContent) =>
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tabbar
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            children: [
                              Expanded(
                                child: TabbarWidget(
                                  tabBarTitle: state.lobbyTabBarTitle,
                                  tabBarIcon: state.lobbyTabBarIcon,
                                  tabActive: state.lobbyTabActive,
                                  backgroundColor: kBlackColor,
                                  iconSize: 20,
                                  onTap: (title) {
                                    state.lobbyTabActive.value = title;
                                    logic.lobbyAlignmentTabbar(title);
                                  },
                                  alignment: state.lobbyActiveAlignment,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Player of the Week section
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Obx(
                            () => Text(
                              state.lobbyTabActive.value == 'Club'
                                  ? 'Club of The Week'
                                  : 'Player of The Week',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: defaultMargin),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: defaultMargin),
                              playerWeekContainer(),
                              playerWeekContainer(),
                              playerWeekContainer(),
                              playerWeekContainer(),
                            ],
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            height:
                                state.lobbyTabActive.value == 'Club' ? 13 : 20,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverAppBarBuilder(
                    initialContentHeight: 700,
                    pinned: true,
                    stretch: false,
                    contentBelowBar: false,
                    barHeight: 50,
                    contentPadding: EdgeInsets.zero,
                    trailingActionsPadding: EdgeInsets.zero,
                    leadingActionsPadding: EdgeInsets.zero,
                    backgroundColorAll: Colors.transparent,
                    floating: false,
                    leadingActions: const [],
                    initialBarHeight: 50,
                    contentBuilder: (context, expandRatio, contentHeight,
                            centerPadding, overlapsContent) =>
                        Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Leaderboard',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox(height: defaultMargin),
                          // Leaderboard title
                          Obx(
                            () => LeaderboardTabbarWidget(
                              tabBarIcon: const [
                                null,
                                null,
                                'assets/images/malaysia.svg',
                                'assets/icons/globe.svg',
                              ],
                              useMarginRight: state.lineUpTabActive.value != ''
                                  ? true
                                  : false,
                              tabBarTitle: state.lineUpTabBarTitle,
                              tabActive: state.lineUpTabActive,
                              iconSize: 20,
                              useIconColor: false,
                              onTap: (title) {
                                state.lineUpTabActive.value = title;
                                logic.alignmentTabbar(title);
                              },
                              alignment: state.lineUpActiveAlignment,
                            ),
                          ),

                          SizedBox(height: defaultMargin),
                          Container(
                            height: 600,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: ListView.builder(
                                controller: _listViewController,
                                padding: EdgeInsets.zero,

                                // physics: state.activeScroll.value
                                //     ? const AlwaysScrollableScrollPhysics()
                                //     : const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return leaderboardItem(number: index + 1);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Leaderboard list inside a scrollable container
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  //     child: Container(
                  //       height: 600,
                  //       margin: const EdgeInsets.only(bottom: 10),
                  //       decoration: BoxDecoration(
                  //         color: kWhiteColor,
                  //         borderRadius: BorderRadius.circular(32),
                  //       ),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(32),
                  //         child: Obx(
                  //           () => ListView.builder(
                  //             controller: _listViewController,
                  //             padding: EdgeInsets.zero,
                  //             physics: state.activeScroll.value
                  //                 ? const AlwaysScrollableScrollPhysics()
                  //                 : const NeverScrollableScrollPhysics(),
                  //             itemCount: 10,
                  //             itemBuilder: (context, index) {
                  //               return leaderboardItem(number: index + 1);
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                ],
              ),
            ),

            // Fixed item at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: leaderboardItem(
                  useShadow: true,
                  paddingVertical: 12,
                  height: 90,
                  marginTop: 0,
                  number: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
