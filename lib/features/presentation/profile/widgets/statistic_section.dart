import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/profile_logic.dart';
import 'package:lawan/features/presentation/profile/profile_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/container/achievement_container.dart';
import '../../../../utility/shared/widgets/text/text_border.dart';
import '../../../../utility/shared/widgets/text/text_gradient.dart';

class StatisticSection extends StatelessWidget {
  final logic = Get.find<ProfileLogic>();
  StatisticSection({super.key});

  @override
  Widget build(BuildContext context) {
    Widget statisticTotalGame({
      required String totalGame,
      required String title,
      bool useBlackText = false,
    }) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: kWhiteColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              useBlackText
                  ? Text(
                      totalGame,
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    )
                  : TextGradient(
                      gradient: mainGradient,
                      textTitle: totalGame,
                      fontSize: 20,
                      textColor: kGreenColor,
                    ),
              Text(
                title,
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    Widget recentViewWidget() {
      return Container(
        height: 140,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/avatars/avatar1.png',
              width: 32,
              height: 32,
            ),
            const Spacer(),
            Text(
              'Shahirah Liyana',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
            const Spacer(),
            CircleButtonTransparentWidget(
              borderColor: kGreyColor,
              onTap: () async {
                logic.changeState(
                  anotherProfile: true,
                  isFavorite: false,
                );
                await Get.toNamed(
                  ProfileUi.namePath,
                  arguments: true,
                  preventDuplicates: false,
                );
                logic.changeState(
                  anotherProfile: false,
                  isFavorite: true,
                );
              },
              size: 44,
              widget: SvgPicture.asset('assets/icons/eye.svg'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // achievement
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
              defaultMargin, 12, defaultMargin, defaultMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  const Spacer(),
                  const TextBorder(
                    textTitle: 'Professional',
                    paddingHorizontal: 6,
                    paddingVertical: 0,
                  ),
                  const Spacer(),
                  Text(
                    'Highest\nRank',
                    style: darkGreyTextStyle.copyWith(
                        fontWeight: medium, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    const AchievementContainer(
                        icon: 'assets/achievement/Award.svg'),
                    const Spacer(),
                    Text(
                      'LPL 2021\nChampion',
                      style: darkGreyTextStyle.copyWith(
                          fontWeight: medium, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const AchievementContainer(
                        icon: 'assets/achievement/Medal.svg'),
                    const Spacer(),
                    Text(
                      'Finisher',
                      style: darkGreyTextStyle.copyWith(
                          fontWeight: medium, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const AchievementContainer(
                        icon: 'assets/achievement/Medal.svg'),
                    const Spacer(),
                    Text(
                      'MVP\nHunter',
                      style: darkGreyTextStyle.copyWith(
                          fontWeight: medium, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: defaultMargin),
        SizedBox(
          height: 84,
          child: Row(
            children: [
              statisticTotalGame(title: 'Goal', totalGame: '330'),
              const SizedBox(width: 8),
              statisticTotalGame(
                title: 'Assist',
                totalGame: '213',
              ),
              const SizedBox(width: 8),
              statisticTotalGame(
                title: 'Save',
                totalGame: '213',
              ),
              const SizedBox(width: 8),
              statisticTotalGame(
                title: 'Goal',
                totalGame: '214',
              ),
              const SizedBox(width: 8),
              statisticTotalGame(
                title: 'Matches',
                totalGame: '2133',
                useBlackText: true,
              ),
            ],
          ),
        ),
        SizedBox(height: defaultMargin),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '55.27%',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    ),
                    Text(
                      'Win Rate',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: kBackgroundColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '2133',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    ),
                    Text(
                      'Win',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: kBackgroundColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '540',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    ),
                    Text(
                      'Draw',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: kBackgroundColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '1944',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    ),
                    Text(
                      'Loss',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // recent visit
        SizedBox(height: defaultMargin),
        if (!logic.isAnotherProfile.value)
          Text('Recent Visits', style: darkGreyTextStyle),
        const SizedBox(height: 8),
        Obx(
          () => logic.isAnotherProfile.value
              ? const SizedBox()
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      recentViewWidget(),
                      recentViewWidget(),
                      recentViewWidget(),
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
