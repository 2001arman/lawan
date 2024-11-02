import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/share_section.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../features/domain/arena/arena_model.dart';
import '../../shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'glass_effect_dialog_container.dart';

class CustomDialog {
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
    var textInput = ''.obs;
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
                  textInput.value = data;
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
                suffix: GestureDetector(
                  onTap: () => nameController.text = '',
                  child: Icon(
                    Icons.highlight_remove_outlined,
                    color: kDarkgreyColor,
                  ),
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
                  Expanded(
                    child: CustomButton(
                      isBlack: false,
                      onTap: Get.back,
                      title: 'Cancel',
                      borderColor: kGreyColor,
                    ),
                  ),
                  SizedBox(width: defaultMargin),
                  Expanded(
                    child: CustomButton(
                      isBlack: true,
                      onTap: () => onSelected(startWheel.selected),
                      title: 'Okay',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> chooseMonth({
    required int selectedMonth,
    required Function(int index) onSelected,
    bool showAllData = false,
  }) {
    // List of month names
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    if (showAllData) {
      monthNames.insert(0, 'All month');
    }

    TextStyle textStyle =
        blackTextStyle.copyWith(fontSize: 14, height: 1.5, fontFamily: 'Lufga');

    var startWheel = WheelPickerController(
      itemCount: monthNames.length, // Adjust for month names
      initialIndex:
          selectedMonth - 1, // Use zero-based index for month selection
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
              SizedBox(
                height: 160,
                width: double.infinity,
                child: WheelPicker(
                  builder: (context, index) => Text(
                    // Display the corresponding month name
                    monthNames[index],
                    style: textStyle.copyWith(
                      fontFamily: 'Lufga',
                    ),
                  ),
                  controller: startWheel,
                  selectedIndexColor: Colors.black,
                  looping: false,
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      isBlack: false,
                      onTap: Get.back,
                      title: 'Cancel',
                      borderColor: kGreyColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      isBlack: true,
                      onTap: () {
                        onSelected(startWheel.selected);
                        Get.back();
                      },
                      title: 'Okay',
                    ),
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
      GlassEffectDialogContainer(
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
                  widget: SvgPicture.asset('assets/icons/x.svg'),
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
                child: ShareSection(
                  onTapBack: Get.back,
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }

  Future<void> showShareDialog() {
    return Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 163,
        padding: EdgeInsets.all(defaultMargin),
        color: kWhiteColor,
        child: const ShareSection(),
      ),
    );
  }
}
