import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/admin/session/session_logic.dart';
import 'package:lawan/features/admin/session/session_state.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/field_image_widget.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/calendar_picker_widget.dart';
import '../../../utility/shared/widgets/choose_time_widget.dart';
import '../../../utility/shared/widgets/circle_button_transparent_widget.dart';
import '../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../utility/shared/widgets/tab_bar_widget.dart';

class AdminAddSession {
  final SessionState state;
  final SessionLogic logic;

  AdminAddSession({required this.state, required this.logic});

  Widget contentSection() {
    switch (state.selectedIndex.value) {
      case 1:
        return slotSection();
      case 2:
        return arenaSection();
      case 3:
        return detailSection();
      default:
        return slotSection();
    }
  }

  Widget topItemBottomSheet(
      {required int number, required String title, required bool isActive}) {
    return GestureDetector(
      onTap: () => state.selectedIndex.value = number,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: isActive ? Colors.transparent : kWhiteColor),
              color: isActive ? kGreenColor : Colors.transparent,
            ),
            child: Center(
              child: Text(
                '$number',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: isActive ? medium : reguler,
                  color: isActive ? kWhiteColor : kDarkgreyColor,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: greenTextStyle.copyWith(
              fontWeight: isActive ? medium : reguler,
              color: isActive ? kGreenColor : kDarkgreyColor,
            ),
          )
        ],
      ),
    );
  }

  void createNewArena() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: Get.height * 0.9,
          width: Get.width,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            padding: EdgeInsets.all(defaultMargin),
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topItemBottomSheet(
                        number: 1,
                        title: 'Slot',
                        isActive: state.selectedIndex.value == 1,
                      ),
                      Container(
                        width: 24,
                        height: 1,
                        color: kWhiteColor,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultMargin, vertical: 20),
                      ),
                      topItemBottomSheet(
                        number: 2,
                        title: 'Arena',
                        isActive: state.selectedIndex.value == 2,
                      ),
                      Container(
                        width: 24,
                        height: 1,
                        color: kWhiteColor,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultMargin, vertical: 20),
                      ),
                      topItemBottomSheet(
                        number: 3,
                        title: 'Details',
                        isActive: state.selectedIndex.value == 3,
                      ),
                    ],
                  ),
                  contentSection(),
                  Row(
                    children: [
                      CustomButton(
                        title: 'Cancel',
                        isBlack: false,
                        onTap: () => Get.back(),
                      ),
                      const SizedBox(width: 16),
                      CustomButton(
                        title: state.selectedIndex.value == 3
                            ? 'Add Arena'
                            : 'Next',
                        isBlack: true,
                        onTap: logic.handleNextButton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    ).whenComplete(() {});
  }

  Widget detailSection() {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(height: defaultMargin),
          Text(
            'Add Manual Booking',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Sync with online booking. Key in the details below.',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            hintText: 'First Name',
            controller: TextEditingController(),
            title: 'First Name',
          ),
          CustomTextFormField(
            hintText: 'Last Name / Family Name',
            controller: TextEditingController(),
            title: 'Last Name',
          ),
          Text(
            'Contact Number',
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: CustomTextFormField(
                  hintText: '+60',
                  controller: TextEditingController(),
                  prefix: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 16,
                      right: 8,
                    ),
                    child: Image.asset(
                      'assets/images/malaysia.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextFormField(
                  hintText: '12 345 6789',
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          CustomTextFormField(
            hintText: 'Enter Identification Number',
            controller: TextEditingController(),
            title: 'Identification Number',
            prefix: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 8,
              ),
              child: SvgPicture.asset(
                'assets/icons/identification.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          CustomTextFormField(
            hintText: '0.00',
            controller: TextEditingController(),
            title: 'Price',
            prefix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RM',
                  style: midGreyTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget slotSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultMargin),
          Text(
            'Select Date',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Choose the time and slot',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomButton(
                isBlack: true,
                onTap: () {},
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.date_range,
                        color: kMidgreyColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      ValueListenableBuilder<DateTime>(
                        valueListenable: focusedDayData,
                        builder: (context, value, _) => Text(
                          DateFormat.MMMM().format(value),
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/arrow_up_down.png',
                        width: 20,
                        height: 20,
                        color: kWhiteColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: defaultMargin),
              CircleButtonTransparentWidget(
                onTap: () => state.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                widget: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                borderColor: kGreyColor,
              ),
              const SizedBox(width: 4),
              CircleButtonTransparentWidget(
                onTap: () => state.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                widget: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                borderColor: kGreyColor,
              ),
            ],
          ),
          SizedBox(height: defaultMargin),
          CalendarPickerWidget(
            pageController: logic.setController,
            calendarMode: CalendarFormat.month,
            cellColor: kWhiteColor,
            cellMargin: 3,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: state.optionHour
                    .map(
                      (data) => SelectedContainerWidget(
                        title: '$data hr',
                        isSelected: data == state.selectedHour.value,
                        onTap: () => state.selectedHour.value = data,
                        isTransparent: true,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: defaultMargin),
          ChooseTimeWidget(
            openTime: state.openTime,
            closeTime: state.closeTime,
            onSave: (startTime, endTime) {
              Get.back();
              state.openTime.value = TimeOfDay(
                hour: startTime,
                minute: 0,
              );
              state.closeTime.value = TimeOfDay(
                hour: endTime,
                minute: 0,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget arenaSection() {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(height: defaultMargin),
          Text(
            'Choose arena',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Set where it should take place',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8),
          TabbarWidget(
            tabBarTitle: state.tabBarTitle,
            tabActive: state.tabActive,
            onTap: (title) {
              state.tabActive.value = title;
              logic.alignmentTabbar(title);
            },
            alignment: state.activeAlignment,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFormField(
                  margin: 0,
                  hintText: '',
                  controller: TextEditingController(),
                  onChanged: (data) {},
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
              ),
              SizedBox(width: defaultMargin),
              SizedBox(
                width: 90,
                child: CustomButton(
                  isBlack: false,
                  onTap: () {},
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Filter',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultMargin),
          const FieldImageWidget(),
          const FieldImageWidget(),
          const FieldImageWidget(),
          const FieldImageWidget(),
          const FieldImageWidget(),
        ],
      ),
    );
  }
}
