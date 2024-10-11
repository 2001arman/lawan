import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/util/dialog_wheel_picker.dart';

import '../../constants/constants_ui.dart';

class ChooseSlotWidget extends StatelessWidget {
  final Rx<int> startAge, endAge;
  final Function(int, int) onSave;
  const ChooseSlotWidget(
      {super.key,
      required this.startAge,
      required this.endAge,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => DialogWheelPicker.showChooseNumberRangeDialog(
              ageEnd: endAge.value,
              ageStart: startAge.value,
              onSave: (startTime, endTime) {
                Get.back();
                startAge.value = startTime;
                endAge.value = endTime;
                onSave(startTime, endTime);
              },
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/info.svg'),
                  const SizedBox(width: 8),
                  Obx(
                    () => Text(
                      '$startAge',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const Spacer(),
                  Image.asset('assets/icons/arrow_up_down.png',
                      width: 20, height: 20),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'to',
            style: darkGreyTextStyle,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => DialogWheelPicker.showChooseNumberRangeDialog(
              ageEnd: endAge.value,
              ageStart: startAge.value,
              onSave: (startTime, endTime) {
                Get.back();
                startAge.value = startTime;
                endAge.value = endTime;
                onSave(startTime, endTime);
              },
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Obx(
                    () => Text(
                      '$endAge',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/arrow_up_down.png',
                    width: 20,
                    height: 20,
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
