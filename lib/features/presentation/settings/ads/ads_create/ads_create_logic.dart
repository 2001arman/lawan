// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_state.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/radio_button_option.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:mime/mime.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/bottom_sheet/custom_bottom_sheet.dart';

class AdsCreateLogic extends GetxController {
  AdsCreateState state = AdsCreateState();

  bool isVideoFile(XFile file) =>
      lookupMimeType(file.path)?.startsWith('video') ?? false;

  void getImageOrVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickMedia();
    if (image != null) {
      state.imagePath.value = image.path;
    }
  }

  void budgetSheet() {
    CustomBottomSheet.showContainerSheet(
      height: 304,
      child: Column(
        children: [
          Text(
            'Budget',
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          SizedBox(height: defaultMargin),
          RadioButtonOption(
            title: 'Unlimited',
            value: 'Unlimited',
            groupValue: state.selectedBudget,
          ),
          RadioButtonOption(
            title: 'Set daily budget',
            value: 'Set daily budget',
            groupValue: state.selectedBudget,
          ),
          CustomTextFormField(
            hintText: '0.00',
            controller: TextEditingController(),
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RM',
                  style: midGreyTextStyle,
                ),
              ],
            ),
          ),
          CustomButton(
            isBlack: true,
            onTap: () {},
            title: 'Okay',
            paddingVertical: 14,
          ),
        ],
      ),
    );
  }

  void durationSheet() {
    CustomBottomSheet.showContainerSheet(
      height: 304,
      child: Column(
        children: [
          Text(
            'Duration',
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          SizedBox(height: defaultMargin),
          RadioButtonOption(
            title: 'Unlimited',
            value: 'Unlimited',
            groupValue: state.selectedDuration,
          ),
          RadioButtonOption(
            title: 'Set start/end date',
            value: 'Set start/end date',
            groupValue: state.selectedDuration,
          ),
          CustomTextFormField(
            hintText: '0.00',
            controller: TextEditingController(
              text: '23 Sep 2024 - 23 Oct 2024',
            ),
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/calendar2.svg',
                  color: kMidgreyColor,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
          CustomButton(
            isBlack: true,
            onTap: () {},
            title: 'Okay',
            paddingVertical: 14,
          ),
        ],
      ),
    );
  }
}
