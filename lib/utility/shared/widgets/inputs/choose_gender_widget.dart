// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/constants_ui.dart';
import '../buttons/custom_button.dart';

class ChooseGenderWidget extends StatelessWidget {
  const ChooseGenderWidget({
    super.key,
    required this.isMaleSelected,
    required this.isFemaleSelected,
    this.borderColor,
    this.isMultipe = true,
  });
  final RxBool isMaleSelected, isFemaleSelected;
  final Color? borderColor;
  final bool isMultipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Gender', style: darkGreyTextStyle),
        SizedBox(width: Get.width * 0.2),
        Obx(
          () => Expanded(
            child: CustomButton(
              isBlack: isMaleSelected.value,
              onTap: () {
                if (isMultipe) {
                  isMaleSelected.toggle();
                } else {
                  if (isMaleSelected.value == false) {
                    isMaleSelected.value = true;
                    isFemaleSelected.value = false;
                  }
                }
              },
              borderColor: borderColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/male.svg',
                    color: isMaleSelected.value ? kWhiteColor : kDarkgreyColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Male',
                    style: whiteTextStyle.copyWith(
                      color:
                          isMaleSelected.value ? kWhiteColor : kDarkgreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Obx(
          () => Expanded(
            child: CustomButton(
              isBlack: isFemaleSelected.value,
              onTap: () {
                if (isMultipe) {
                  isFemaleSelected.toggle();
                } else {
                  if (isFemaleSelected.value == false) {
                    isFemaleSelected.value = true;
                    isMaleSelected.value = false;
                  }
                }
              },
              borderColor: borderColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/female.svg',
                    color:
                        isFemaleSelected.value ? kWhiteColor : kDarkgreyColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Female',
                    style: whiteTextStyle.copyWith(
                      color:
                          isFemaleSelected.value ? kWhiteColor : kDarkgreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
