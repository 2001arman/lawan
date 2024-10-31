// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/utility/shared/widgets/fields/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';
import 'package:lawan/utility/shared/widgets/text/text_icon.dart';

import '../../../../features/domain/arena/arena_model.dart';
import '../../../util/helper.dart';
import '../../constants/constants_ui.dart';
import '../buttons/custom_button.dart';
import '../buttons/gradient_button.dart';

class FieldSessionWidget extends StatelessWidget {
  final SessionModel sessionModel;
  final bool showGameInformation;
  const FieldSessionWidget({
    super.key,
    required this.sessionModel,
    required this.showGameInformation,
  });

  @override
  Widget build(BuildContext context) {
    ArenaModel arenaModel = sessionModel.arena;
    int selectedCourt = sessionModel.selectedCourt;

    Widget upComingSession() {
      return Container(
        width: Get.width * 0.75,
        height: 48,
        decoration: BoxDecoration(
          boxShadow: greenBoxShadow,
        ),
        child: Row(
          children: [
            CustomButton(
              isBlack: true,
              onTap: () {},
              paddingVertical: 0,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sesssion starting in',
                    style: midGreyTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    Helper.timeBetweenNowAndSession(
                      sessionModel.getStartDateTime(),
                    ),
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget gameOn() {
      return SizedBox(
        width: Get.width * 0.5,
        height: 48,
        child: GradientButton(
          onTap: () {},
          paddingVertical: 0,
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The session has begun',
                style: midGreyTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                'Game on!',
                style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.88 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(width: 1, color: kGreyColor),
                image: DecorationImage(
                  image: arenaModel.courtData[selectedCourt].pictureType ==
                          PictureType.asset
                      ? AssetImage(
                          arenaModel
                              .courtData[selectedCourt].pictures.first.path,
                        )
                      : FileImage(
                          File(arenaModel
                              .courtData[selectedCourt].pictures.first.path),
                        ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        gradient: shadowGradient,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: Get.width * 0.5,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: kBlackColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          ),
                        ),
                        child: Text(
                          arenaModel.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                            height: 12 / 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      if (showGameInformation)
                        Visibility(
                          visible: Helper.isUpcoming(sessionModel.dateTime),
                          replacement: gameOn(),
                          child: upComingSession(),
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                        child: Row(
                          children: [
                            TextBorder(
                              textTitle: '5.2km',
                              backgroundColor: kWhiteColor,
                              paddingVertical: 0,
                              paddingHorizontal: 8,
                              borderColor: Colors.transparent,
                            ),
                            Expanded(
                              child: showGameInformation
                                  ? const SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/avatars_image.png',
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'VS',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 10, fontWeight: bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(width: 8),
                                        Image.asset(
                                            'assets/images/avatars_image.png',
                                            height: 20),
                                      ],
                                    ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/users.svg',
                                  color: kGreyColor,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '8/28',
                                  style: whiteTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            icon: SvgPicture.asset(
                              'assets/icons/calendar2.svg',
                              color: kMidgreyColor,
                              width: 16,
                            ),
                            text: 'Date',
                          ),
                          Text(
                            Helper.formatDayAndDate(sessionModel.dateTime.day),
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          TextIcon(
                            icon: SvgPicture.asset(
                              'assets/icons/clock.svg',
                              color: kMidgreyColor,
                              width: 16,
                            ),
                            text: 'Time',
                          ),
                          const Spacer(),
                          Text(
                            '${Helper.formatTime12Hour(sessionModel.startHour)} - ${Helper.formatTime12Hour(sessionModel.endHour)}',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                          const SizedBox(width: 4),
                          const TextBorder(
                            textTitle: '2hr',
                            paddingVertical: 0,
                            paddingHorizontal: 6,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            icon: SvgPicture.asset(
                              'assets/icons/location.svg',
                              color: kMidgreyColor,
                              width: 16,
                            ),
                            text: 'Location',
                          ),
                          const SizedBox(width: 8),
                          FieldNumberWidget(
                            mainAxisAlignment: MainAxisAlignment.end,
                            court:
                                '${arenaModel.courtData[selectedCourt].courtName}, ${arenaModel.location}',
                            iconColor: kMidgreyColor,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 44,
                  height: 70,
                  margin: EdgeInsets.only(left: defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: kGreyColor),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/player-play.svg',
                    width: 20,
                    height: 20,
                    color: kDarkgreyColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
