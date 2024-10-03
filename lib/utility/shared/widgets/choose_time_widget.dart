import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/custom_dialog.dart';
import '../../util/helper.dart';
import '../constants/constants_ui.dart';

class ChooseTimeWidget extends StatelessWidget {
  final Rx<TimeOfDay> openTime, closeTime;
  final Function(int, int) onSave;
  final int? totalHour;
  const ChooseTimeWidget({
    super.key,
    required this.openTime,
    required this.closeTime,
    required this.onSave,
    this.totalHour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => CustomDialog.showChooseTimeDialog(
              startTime: openTime.value.hour,
              endTime: closeTime.value.hour,
              totalHour: totalHour,
              onSave: (startTime, endTime) {
                openTime.value = TimeOfDay(
                  hour: startTime,
                  minute: 0,
                );
                closeTime.value = TimeOfDay(
                  hour: endTime,
                  minute: 0,
                );
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
                  Image.asset(
                    'assets/icons/clock.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Obx(
                    () => Text(
                      Helper.formatTime12Hour(openTime.value),
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
            onTap: () => CustomDialog.showChooseTimeDialog(
              startTime: openTime.value.hour,
              endTime: closeTime.value.hour,
              onSave: (startTime, endTime) {
                openTime.value = TimeOfDay(
                  hour: startTime,
                  minute: 0,
                );
                closeTime.value = TimeOfDay(
                  hour: endTime,
                  minute: 0,
                );
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
                  Image.asset(
                    'assets/icons/clock.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Obx(
                    () => Text(
                      Helper.formatTime12Hour(closeTime.value),
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
