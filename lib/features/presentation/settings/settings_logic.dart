import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/settings_state.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/bottom_sheet/custom_bottom_sheet.dart';

class SettingsLogic extends GetxController {
  SettingsState state = SettingsState();

  String getSelectedLanguage() {
    return state.selectedLanguage.value;
  }

  Widget radioButtonOption({
    required String title,
    String? subTitle,
    required String value,
    required RxString groupValue,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
              if (subTitle != null)
                Text(
                  subTitle,
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
            ],
          ),
        ),
        Transform.scale(
          scale: 1.8,
          child: Radio(
            value: value,
            groupValue: groupValue.value,
            onChanged: (newVal) {
              groupValue.value = value;
            },
            activeColor: kGreenColor,
          ),
        ),
      ],
    );
  }

  void appearanceSheet() {
    CustomBottomSheet.showContainerSheet(
      height: 248,
      child: Obx(
        () => Column(
          children: [
            Text(
              'Appearance',
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            radioButtonOption(
              title: 'Same as device',
              subTitle:
                  'Uses light or dark mode depending on your device settings.',
              value: 'Device',
              groupValue: state.selectedTheme,
            ),
            radioButtonOption(
              title: 'Light',
              value: 'Light',
              groupValue: state.selectedTheme,
            ),
            radioButtonOption(
              title: 'Dark',
              value: 'Dark',
              groupValue: state.selectedTheme,
            ),
          ],
        ),
      ),
    );
  }

  void languageSheet() {
    CustomBottomSheet.showContainerSheet(
      height: 194,
      child: Obx(
        () => Column(
          children: [
            Text(
              'Language',
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: defaultMargin),
            radioButtonOption(
              title: 'English',
              value: 'English',
              groupValue: state.selectedLanguage,
            ),
            radioButtonOption(
              title: 'Bahasa Malaysia',
              value: 'Bahasa Malaysia',
              groupValue: state.selectedLanguage,
            ),
          ],
        ),
      ),
    );
  }
}
