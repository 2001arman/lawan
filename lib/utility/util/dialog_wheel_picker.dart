import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../shared/constants/constants_ui.dart';
import '../shared/widgets/buttons/custom_button.dart';
import 'helper.dart';

class DialogWheelPicker {
  static Future<void> showChooseTimeDialog({
    required int startTime,
    required int endTime,
    required Function(int startTime, int endTime) onSave,
    int? totalHour,
  }) {
    final startWheel = WheelPickerController(
      itemCount: 24,
      initialIndex: startTime,
    );
    final endWheel = WheelPickerController(
      itemCount: 24,
      initialIndex: endTime,
    );
    TextStyle textStyle =
        blackTextStyle.copyWith(fontSize: 14, height: 1.5, fontFamily: 'Lufga');
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          height: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          Helper.formatTime12Hour(
                            TimeOfDay(hour: index, minute: 0),
                          ),
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: startWheel,
                        selectedIndexColor: Colors.black,
                        onIndexChanged: (index) {
                          if (totalHour != null) {
                            endWheel.setCurrent(index + totalHour);
                          }
                        },
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height
                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                    Text(
                      'to',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          Helper.formatTime12Hour(
                            TimeOfDay(hour: index, minute: 0),
                          ),
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: endWheel,
                        selectedIndexColor: Colors.black,
                        onIndexChanged: (index) {
                          if (totalHour != null) {
                            endWheel
                                .setCurrent(startWheel.selected + totalHour);
                          }
                        },
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height

                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    title: 'Cancel',
                    isBlack: false,
                    onTap: Get.back,
                    borderColor: kGreyColor,
                  ),
                  SizedBox(width: defaultMargin),
                  CustomButton(
                    title: 'Save',
                    isBlack: true,
                    onTap: () => onSave(startWheel.selected, endWheel.selected),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showChoosePriceDialog({
    required int selectedPrice,
    required double selectedHour,
    required Function(int price, double hourTime) onSave,
  }) {
    final priceWheel = WheelPickerController(
      itemCount: 100,
      initialIndex: selectedPrice ~/ 10,
    );
    final hourWheel = WheelPickerController(
      itemCount: 25,
      initialIndex: selectedHour == 0.5 ? 0 : selectedHour.toInt(),
    );
    TextStyle textStyle =
        blackTextStyle.copyWith(fontSize: 14, height: 1.5, fontFamily: 'Lufga');
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          height: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'RM',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          '${(index + 1) * 10}',
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: priceWheel,
                        selectedIndexColor: Colors.black,
                        onIndexChanged: (index) {},
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height
                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          index == 0 ? '0.5' : '$index',
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: hourWheel,
                        selectedIndexColor: Colors.black,
                        onIndexChanged: (index) {},
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height

                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                    Text(
                      'Hour',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    title: 'Cancel',
                    isBlack: false,
                    onTap: Get.back,
                    borderColor: kGreyColor,
                  ),
                  SizedBox(width: defaultMargin),
                  CustomButton(
                    title: 'Save',
                    isBlack: true,
                    onTap: () {
                      final selectedPrice = (priceWheel.selected + 1) * 10;
                      final double selectedHour = hourWheel.selected == 0
                          ? 0.5
                          : hourWheel.selected.toDouble();
                      onSave(selectedPrice, selectedHour);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showChooseNumberRangeDialog({
    required int ageStart,
    required int ageEnd,
    required Function(int ageStart, int ageEnd) onSave,
    String text = '',
  }) {
    final startWheel = WheelPickerController(
      itemCount: 100,
      initialIndex: ageStart,
    );
    final endWheel = WheelPickerController(
      itemCount: 100,
      initialIndex: ageEnd,
    );
    TextStyle textStyle =
        blackTextStyle.copyWith(fontSize: 14, height: 1.5, fontFamily: 'Lufga');
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          height: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          '$index $text',
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: startWheel,
                        selectedIndexColor: Colors.black,
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height
                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                    const Text(
                      'to',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: WheelPicker(
                        builder: (context, index) => Text(
                          '$index $text',
                          style: textStyle.copyWith(
                            fontFamily: 'Lufga',
                          ),
                        ),
                        controller: endWheel,
                        selectedIndexColor: Colors.black,
                        style: WheelPickerStyle(
                          itemExtent: textStyle.fontSize! *
                              textStyle.height!, // Text height

                          squeeze: 0.9,
                          diameterRatio: 1,
                          surroundingOpacity: .25,
                          magnification: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    title: 'Cancel',
                    isBlack: false,
                    onTap: Get.back,
                    borderColor: kGreyColor,
                  ),
                  SizedBox(width: defaultMargin),
                  CustomButton(
                    title: 'Save',
                    isBlack: true,
                    onTap: () => onSave(startWheel.selected, endWheel.selected),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
