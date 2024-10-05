import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/share_section.dart';
import 'package:lawan/utility/util/helper.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../features/domain/arena/arena_model.dart';
import '../shared/widgets/circle_button_transparent_widget.dart';

class CustomDialog {
  Widget glassEfectDialogContainer(
      {required Widget child, double height = 0.8}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: Get.height * height,
        width: Get.width,
      ).blurred(
        blur: 7,
        blurColor: Colors.white,
        colorOpacity: 0,
        borderRadius: BorderRadius.circular(32),
        overlay: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: kModalColor,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -0.5),
                blurStyle: BlurStyle.inner,
                spreadRadius: 0,
                blurRadius: 0,
                color: kBlackColor.withOpacity(0.1),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  static Future<void> editAddDialog(
      {required VoidCallback onTapEdit, required VoidCallback onTapAdd}) {
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onTapEdit,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/pencil.png',
                        width: 15,
                        height: 15,
                        color: kDarkgreyColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Edit',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: kGreyColor,
              ),
              GestureDetector(
                onTap: onTapAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: kDarkgreyColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Add',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> chooseArenaDialog({
    required List<ArenaModel> listArena,
    required int selectedArena,
    required Function(int index) onSelected,
    required Function(String name) onSearch,
  }) {
    var tempArena = <ArenaModel>[].obs;
    tempArena.addAll(listArena);
    TextStyle textStyle =
        blackTextStyle.copyWith(fontSize: 14, height: 1.5, fontFamily: 'Lufga');
    TextEditingController nameController = TextEditingController();
    var startWheel = WheelPickerController(
      itemCount: tempArena.length,
      initialIndex: selectedArena,
    );
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                hintText: '',
                controller: nameController,
                onChanged: (data) {
                  tempArena.assignAll(listArena.where((arena) =>
                      arena.name.toLowerCase().contains(data.toLowerCase())));
                  tempArena.refresh();
                  selectedArena = 0;
                  startWheel =
                      WheelPickerController(itemCount: tempArena.length);
                },
                borderColor: kGreyColor,
                prefix: Icon(
                  Icons.search,
                  color: kDarkgreyColor,
                ),
                suffix: Icon(
                  Icons.highlight_remove_outlined,
                  color: kDarkgreyColor,
                ),
              ),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: WheelPicker(
                  builder: (context, index) => Text(
                    tempArena[index].name,
                    style: textStyle.copyWith(
                      fontFamily: 'Lufga',
                    ),
                  ),
                  controller: startWheel,
                  selectedIndexColor: Colors.black,
                  looping: false,
                  // onIndexChanged: (index) {},
                  style: WheelPickerStyle(
                    itemExtent:
                        textStyle.fontSize! * textStyle.height!, // Text height
                    squeeze: 0.9,
                    diameterRatio: 1,
                    surroundingOpacity: .25,
                    magnification: 1.2,
                  ),
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    isBlack: false,
                    onTap: Get.back,
                    title: 'Cancel',
                    borderColor: kGreyColor,
                  ),
                  SizedBox(width: defaultMargin),
                  CustomButton(
                    isBlack: true,
                    onTap: () => onSelected(startWheel.selected),
                    title: 'Okay',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

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
                    const Text(
                      'to',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
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
                      style: blackTextStyle.copyWith(fontSize: 12),
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
                      style: blackTextStyle.copyWith(fontSize: 12),
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

  Widget receiptDetailValue({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: darkGreyTextStyle.copyWith(fontSize: 12),
        ),
        Text(
          value,
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
        ),
      ],
    );
  }

  Future<void> showRecipeDialog() {
    return Get.bottomSheet(
      glassEfectDialogContainer(
        height: 0.85,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.5,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: mainGradient,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                      ),
                      child: Text(
                        'Receipt',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                    SvgPicture.asset(
                      'assets/icons/logo.svg',
                    ),
                    SizedBox(height: defaultMargin),
                    Text(
                      'Successful',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Transaction Summary',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'RM20.00',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '23 Jul 2024 09:57:59 PM',
                      style: darkGreyTextStyle.copyWith(
                          fontSize: 11, fontWeight: medium),
                    ),
                    SizedBox(height: defaultMargin),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: kGreyColor),
                      ),
                      child: Column(
                        children: [
                          receiptDetailValue(
                              title: 'Reference No', value: '3525224223'),
                          const SizedBox(height: 8),
                          receiptDetailValue(
                              title: 'To', value: 'TEK Industries'),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: kGreyColor,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          receiptDetailValue(
                            title: 'Payment Method',
                            value: 'DuitNow',
                          ),
                          const SizedBox(height: 8),
                          receiptDetailValue(
                            title: 'Transfer Type',
                            value: 'Within CIMB Bank',
                          ),
                          const SizedBox(height: 8),
                          receiptDetailValue(
                            title: 'Payment Type',
                            value: 'Instant Transfer',
                          ),
                          const SizedBox(height: 8),
                          receiptDetailValue(
                            title: 'Recipient Reference',
                            value: 'Lawan - Friendly Session',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                    Text(
                      'Note',
                      textAlign: TextAlign.center,
                      style: darkGreyTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                    Text(
                      'This receipt  is computer generated\nand no signature is required.',
                      textAlign: TextAlign.center,
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircleButtonTransparentWidget(
                  size: 40,
                  onTap: Get.back,
                  borderColor: kGreyColor,
                  widget: Icon(
                    Icons.close,
                    color: kDarkgreyColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 163,
                padding: EdgeInsets.all(defaultMargin),
                color: kWhiteColor,
                child: const ShareSection(),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}
