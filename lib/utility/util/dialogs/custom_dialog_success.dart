// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/calendar/calendar_picker_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/constants/action_type.dart';
import '../../shared/constants/arena_type.dart';
import '../../shared/constants/constants_ui.dart';
import '../../shared/widgets/buttons/custom_button.dart';
import '../../shared/widgets/calendar/calendar_month_widget.dart';
import '../../shared/widgets/selected_container_widget.dart';
import '../../shared/widgets/wheel_picker/choose_time_widget.dart';

class CustomDialogSuccess {
  static void successCreateArena({
    required VoidCallback ontapAddCourt,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 288,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 288,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Arena Added Successfully!',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/icons/field_gradient.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 8),
                Text(
                  'You can now start earning from this arena',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  title: 'Add Another Court',
                  isBlack: false,
                  onTap: ontapAddCourt,
                  width: double.infinity,
                ),
                const SizedBox(height: 8),
                CustomButton(
                  title: 'Done',
                  isBlack: true,
                  onTap: Get.back,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void editArenaDialog({
    required ArenaType arenaType,
    required String data,
    required Function(String newData) onAction,
    required VoidCallback onDelete,
  }) {
    TextEditingController dataController = TextEditingController(text: data);
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 279,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 279,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/pencil.png',
                      color: kWhiteColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Edit ${arenaType.title} Name',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: '',
                  controller: dataController,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  width: double.infinity,
                  title: 'Cancel',
                  isBlack: false,
                  onTap: Get.back,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: () {
                        Get.back();
                        confirmDialog(
                          actionType: ActionType.delete,
                          onAction: onDelete,
                        );
                      },
                      widget: SvgPicture.asset(
                        'assets/icons/trash.svg',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButton(
                        title: 'Update',
                        isBlack: true,
                        onTap: () {
                          Get.back();
                          confirmDialog(
                            actionType: ActionType.edit,
                            onAction: () => onAction(dataController.text),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void confirmDialog({
    required ActionType actionType,
    required VoidCallback onAction,
    String name = '',
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 245,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 245,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionType.title(name: name),
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Text(
                  actionType.description,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: reguler,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                CustomButton(
                  width: double.infinity,
                  title: 'Cancel',
                  isBlack: false,
                  onTap: Get.back,
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: actionType == ActionType.delete,
                  replacement: CustomButton(
                    width: double.infinity,
                    title: 'Confirm',
                    isBlack: true,
                    onTap: onAction,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    title: 'Delete',
                    isBlack: false,
                    borderColor: kRedColor,
                    textColor: kRedColor,
                    onTap: onAction,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void rescheduleDialog({required VoidCallback onSubmit}) {
    PageController pageController = PageController();
    var openTime = const TimeOfDay(hour: 9, minute: 00).obs;
    var closeTime = const TimeOfDay(hour: 10, minute: 00).obs;
    List<int> listHour = [1, 2, 3, 4, 5];
    var selectedHour = 2.obs;
    var calendarFormat = CalendarFormat.month.obs;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 609,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 609,
            padding: EdgeInsets.only(top: 24, bottom: defaultMargin),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    'Reschedule Session',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    'Choose the time and slot',
                    style: darkGreyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    children: [
                      CalendarMonthWidget(
                        calendarFormat: calendarFormat,
                        onSelected: (index) => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      CircleButtonTransparentWidget(
                        onTap: () => pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                        widget: SvgPicture.asset(
                          'assets/icons/back.svg',
                          color: kBlackColor,
                        ),
                        borderColor: kGreyColor,
                      ),
                      const SizedBox(width: 4),
                      CircleButtonTransparentWidget(
                        onTap: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                        widget: SvgPicture.asset(
                          'assets/icons/forward.svg',
                          color: kBlackColor,
                        ),
                        borderColor: kGreyColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Obx(
                    () => CalendarPickerWidget(
                      pageController: (controller) =>
                          pageController = controller,
                      calendarMode: calendarFormat.value,
                      cellColor: kWhiteColor,
                      cellMargin: 3,
                      onDaySelected: (data) {},
                      fixedMode: true,
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                // option hour
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: [
                        SizedBox(width: defaultMargin),
                        ...listHour.map(
                          (data) => SelectedContainerWidget(
                            title: '$data hr',
                            isSelected: selectedHour.value == data,
                            onTap: () {
                              selectedHour.value = data;
                              closeTime.value = TimeOfDay(
                                hour: openTime.value.hour + data,
                                minute: 0,
                              );
                            },
                            isTransparent: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Obx(
                    () => ChooseTimeWidget(
                      openTime: openTime,
                      closeTime: closeTime,
                      totalHour: selectedHour.value,
                      onSave: (startTime, endTime) {
                        Get.back();
                        openTime.value = TimeOfDay(
                          hour: startTime,
                          minute: 0,
                        );
                        closeTime.value = TimeOfDay(
                          hour: endTime,
                          minute: 0,
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: 'Cancel',
                          isBlack: false,
                          onTap: () => Get.back(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          title: 'Next',
                          isBlack: true,
                          onTap: () {
                            Get.back();
                            onSubmit();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
