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

class FieldSessionWidget extends StatelessWidget {
  final SessionModel sessionModel;
  const FieldSessionWidget({super.key, required this.sessionModel});

  @override
  Widget build(BuildContext context) {
    ArenaModel arenaModel = sessionModel.arena;
    int selectedCourt = sessionModel.selectedCourt;
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
                  // Center(
                  // child: SizedBox(
                  //   width: Get.width * 0.8,
                  //   height: 58,
                  //   child: CustomButton(
                  //     isBlack: true,
                  //     onTap: () {},
                  //     paddingVertical: 8,
                  //     widget: Column(
                  //       children: [
                  //         Text(
                  //           'Sesssion starting in',
                  //           style: midGreyTextStyle.copyWith(fontSize: 12),
                  //         ),
                  //         Text(
                  //           Helper.timeBetweenNowAndSession(
                  //             sessionModel.getStartDateTime(),
                  //           ),
                  //           style: whiteTextStyle.copyWith(
                  //             fontSize: 16,
                  //             fontWeight: semiBold,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // child: SizedBox(
                  //   width: Get.width * 0.5,
                  //   height: 64,
                  //   child: GradientButton(
                  //     onTap: () {},

                  //     widget: Column(
                  //       children: [
                  //         Text(
                  //           'The session has begun',
                  //           style: midGreyTextStyle.copyWith(fontSize: 12),
                  //         ),
                  //         Text(
                  //           'Game on!',
                  //           style: whiteTextStyle.copyWith(
                  //               fontSize: 16, fontWeight: bold),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // ),
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
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Row(
                          children: [
                            TextBorder(
                              textTitle: '5.2km',
                              backgroundColor: kWhiteColor,
                              paddingVertical: 0,
                              paddingHorizontal: 8,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  Image.asset('assets/images/avatars_image.png',
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
                              'assets/icons/calendar.svg',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            icon: SvgPicture.asset(
                              'assets/icons/clock.svg',
                              color: kMidgreyColor,
                              width: 16,
                            ),
                            text: 'Time',
                          ),
                          Text(
                            '${Helper.formatTime12Hour(sessionModel.startHour)} - ${Helper.formatTime12Hour(sessionModel.endHour)}',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
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
