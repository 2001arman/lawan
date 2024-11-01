import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants_ui.dart';
import '../buttons/custom_button.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget(
      {super.key,
      required this.isMalaySelected,
      required this.isEnglishSelected,
      this.borderColor});
  final RxBool isMalaySelected, isEnglishSelected;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Language', style: darkGreyTextStyle),
        SizedBox(width: Get.width * 0.15),
        Obx(
          () => Expanded(
            child: CustomButton(
              isBlack: isEnglishSelected.value,
              onTap: isEnglishSelected.toggle,
              borderColor: borderColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/uk.png', width: 16),
                  const SizedBox(width: 4),
                  Text(
                    'English',
                    style: whiteTextStyle.copyWith(
                      color: isEnglishSelected.value
                          ? kWhiteColor
                          : kDarkgreyColor,
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
              isBlack: isMalaySelected.value,
              onTap: isMalaySelected.toggle,
              borderColor: borderColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/malaysia.png', width: 16),
                  const SizedBox(width: 4),
                  Text(
                    'Malay',
                    style: whiteTextStyle.copyWith(
                      color:
                          isMalaySelected.value ? kWhiteColor : kDarkgreyColor,
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
