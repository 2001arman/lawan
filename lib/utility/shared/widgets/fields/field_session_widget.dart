import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/fields/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';
import 'package:lawan/utility/shared/widgets/text/text_icon.dart';

import '../../../../features/domain/arena/arena_model.dart';
import '../../constants/constants_ui.dart';

class FieldSessionWidget extends StatelessWidget {
  final ArenaModel arenaModel;
  final bool isSelected;
  final int selectedCourt;
  const FieldSessionWidget(
      {super.key,
      required this.arenaModel,
      required this.isSelected,
      required this.selectedCourt});

  @override
  Widget build(BuildContext context) {
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
              child: Column(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                            Icon(
                              Icons.group_outlined,
                              color: kGreyColor,
                              size: 20,
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
                            icon: Icon(
                              Icons.date_range_outlined,
                              size: 20,
                              color: kMidgreyColor,
                            ),
                            text: 'Date',
                          ),
                          Text(
                            '(Tomorrow) Tue,  25 Sep',
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
                            icon: Icon(
                              Icons.access_time_outlined,
                              size: 20,
                              color: kMidgreyColor,
                            ),
                            text: 'Time',
                          ),
                          Text(
                            '9:00 AM - 11:00 AM',
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
                            icon: Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: kMidgreyColor,
                            ),
                            text: 'Location',
                          ),
                          FieldNumberWidget(
                            court: '1, Petaling Jaya',
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
                  height: 100,
                  margin: EdgeInsets.only(left: defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: kGreyColor),
                  ),
                  child: Icon(
                    Icons.play_arrow_outlined,
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
