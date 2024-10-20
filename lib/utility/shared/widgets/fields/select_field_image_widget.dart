// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_widget.dart';

import '../../constants/constants_ui.dart';
import '../text/text_border.dart';

class SelectFieldImageWidget extends StatefulWidget {
  final ArenaModel arenaModel;
  final bool isSelected;
  final int? selectedCourt;
  final Function(int selectedCourt) onChangeCourt;
  const SelectFieldImageWidget({
    super.key,
    required this.arenaModel,
    required this.isSelected,
    required this.onChangeCourt,
    this.selectedCourt,
  });

  @override
  State<SelectFieldImageWidget> createState() => _SelectFieldImageWidgetState();
}

class _SelectFieldImageWidgetState extends State<SelectFieldImageWidget> {
  int selectedCourtIndex = 0;
  late PictureType pictureType;
  late String path;
  @override
  void initState() {
    selectedCourtIndex = widget.selectedCourt ?? 0;
    pictureType = widget.arenaModel.courtData[selectedCourtIndex].pictureType;
    path = widget.arenaModel.courtData[selectedCourtIndex].pictures.first.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
                  image: pictureType == PictureType.asset
                      ? AssetImage(
                          path,
                        )
                      : FileImage(
                          File(path),
                        ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: Get.width * 0.5,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                    child: Text(
                      widget.arenaModel.name,
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: widget.isSelected,
                      child: CircleButtonWidget(
                        onTap: () {},
                        widget: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/icons/check.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          borderColor: Colors.transparent,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  color: kWhiteColor,
                                ),
                                Flexible(
                                  child: Text(
                                    widget.arenaModel.location,
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 12, fontWeight: medium),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextBorder(
                          textTitle: widget.arenaModel
                              .courtData[selectedCourtIndex].flooringType,
                          backgroundColor: kWhiteColor,
                          paddingVertical: 0,
                          paddingHorizontal: 8,
                          borderColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Visibility(
              visible:
                  widget.arenaModel.courtData.length > 1 && widget.isSelected,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/arena.svg',
                        color: kMidgreyColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Choose Court',
                        style: darkGreyTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.arenaModel.courtData
                          .asMap()
                          .entries
                          .map(
                            (court) => CircleButtonWidget(
                              widget: Center(
                                child: Text(
                                  court.value.courtName,
                                  style: whiteTextStyle.copyWith(
                                    color: court.key == selectedCourtIndex
                                        ? kWhiteColor
                                        : kBlackColor,
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.only(right: 12),
                              borderColor: court.key != selectedCourtIndex
                                  ? kGreyColor
                                  : Colors.transparent,
                              onTap: () {
                                widget.onChangeCourt(court.key);
                                setState(() {
                                  selectedCourtIndex = court.key;
                                  path = widget.arenaModel.courtData[court.key]
                                      .pictures.first.path;
                                });
                              },
                              isActive: court.key == selectedCourtIndex,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
