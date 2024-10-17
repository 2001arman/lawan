import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/utility/shared/widgets/fields/field_number_widget.dart';

import '../../constants/constants_ui.dart';
import '../text/text_border.dart';

class FieldImageWidget extends StatelessWidget {
  final ArenaModel arenaModel;
  final int selectedCourt;
  final bool showInformation;
  final bool showLocation;
  const FieldImageWidget({
    super.key,
    required this.arenaModel,
    required this.selectedCourt,
    this.showInformation = false,
    this.showLocation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 1, color: kGreyColor),
        image: DecorationImage(
          image: arenaModel.courtData[selectedCourt].pictureType ==
                  PictureType.asset
              ? AssetImage(
                  arenaModel.courtData[selectedCourt].pictures.first.path,
                )
              : FileImage(
                  File(arenaModel.courtData[selectedCourt].pictures.first.path),
                ),
          fit: BoxFit.cover,
        ),
      ),
      child: Visibility(
        visible: showInformation,
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                    child: Visibility(
                      visible: showLocation,
                      replacement: Row(
                        children: [
                          FieldNumberWidget(
                            court: '${selectedCourt + 1}',
                            iconColor: kWhiteColor,
                            textColor: kWhiteColor,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: kWhiteColor,
                            size: 20,
                          ),
                          Flexible(
                            child: Text(
                              arenaModel.location,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextBorder(
                        textTitle:
                            arenaModel.courtData[selectedCourt].flooringType,
                        backgroundColor: kWhiteColor,
                        paddingVertical: 0,
                        paddingHorizontal: 8,
                        borderColor: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
