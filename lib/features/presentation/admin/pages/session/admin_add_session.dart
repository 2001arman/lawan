// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_logic.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_state.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/calendar/calendar_month_widget.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:lawan/utility/util/formatter/alphabet_formatter.dart';
import 'package:lawan/utility/util/formatter/identification_number_formatter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/calendar/calendar_picker_widget.dart';
import '../../../../../utility/shared/widgets/fields/choose_arena_section_modal.dart';
import '../../../../../utility/shared/widgets/wheel_picker/choose_time_widget.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/util/helper.dart';
import '../../../../domain/session/session_model.dart';

class AdminAddSession {
  final SessionState state;
  final SessionLogic logic;

  AdminAddSession({required this.state, required this.logic});

  Widget contentSection({SessionModel? sessionData}) {
    switch (state.selectedIndex.value) {
      case 2:
        return ChooseArenaSectionModal(
          onSelectedArena: logic.onSelectedArena,
          selectedArena: state.selectedArenaIndex,
          selectedCourt: state.selectedCourtIndex,
        );
      case 3:
        return detailSection(sessionData: sessionData);
      default:
        return slotSection(sessionData: sessionData);
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

  void createNewSession({
    SessionModel? sessionData,
    int? dateIndex,
    int? sessionIndex,
  }) {
    if (sessionData != null) {
      state.selectedHour.value = sessionData.totalHour;
      state.openTime.value = sessionData.startHour;
      state.closeTime.value = sessionData.endHour;
      state.selectedDate = sessionData.dateTime;
    }

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
                  Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: Row(
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
                  ),
                  contentSection(sessionData: sessionData),
                  Padding(
                    padding: EdgeInsets.all(defaultMargin),
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
                            onTap: () => logic.handleNextButton(
                              sessionData: sessionData,
                              dateIndex: dateIndex,
                              sessionIndex: sessionIndex,
                            ),
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
      ),
      isScrollControlled: true,
      enableDrag: true,
    ).whenComplete(() {});
  }

  Widget detailSection({SessionModel? sessionData}) {
    if (sessionData != null) {
      state.firstNameController.text = sessionData.firstName;
      state.lastNameController.text = sessionData.lastName;
      state.contactController.text = sessionData.contactNumber;
      state.identificationController.text = sessionData.identificationNumber;
      state.priceController.text = sessionData.price.toString();
    }
    return Expanded(
      child: Form(
        key: state.textFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
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
              controller: state.firstNameController,
              title: 'First Name',
              validator: (data) => Helper.regularValidator(data),
              inputFormatters: [
                AlphabeticFormatter(),
              ],
            ),
            CustomTextFormField(
              hintText: 'Last Name / Family Name',
              controller: state.lastNameController,
              title: 'Last Name',
              validator: (data) => Helper.regularValidator(data),
              inputFormatters: [
                AlphabeticFormatter(),
              ],
            ),
            Text(
              'Contact Number',
              style: darkGreyTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: CustomTextFormField(
                    hintText: '+60',
                    controller: TextEditingController(),
                    validator: (_) {
                      if (state.contactController.text == '') {
                        return '';
                      }
                      return null;
                    },
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          'assets/images/malaysia.svg',
                          height: 16,
                          width: 16,
                        ),
                      ],
                    ),
                    isReadOnly: true,
                    verticalPadding: 14,
                    horizontalPadding: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextFormField(
                    hintText: '12 345 6789',
                    controller: state.contactController,
                    textInputType: TextInputType.number,
                    validator: (data) => Helper.numberValidator(data),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            CustomTextFormField(
              hintText: 'Enter Identification Number',
              controller: state.identificationController,
              title: 'Identification Number',
              textInputType: TextInputType.number,
              validator: (data) => Helper.numberValidator(data),
              maxLength: 14,
              inputFormatters: [
                IdentificationNumberFormatter(),
              ],
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
              controller: state.priceController,
              textInputType: TextInputType.number,
              title: 'Price',
              validator: (data) => Helper.numberValidator(data),
              maxLength: 7,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
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
      ),
    );
  }

  Widget slotSection({SessionModel? sessionData}) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Select Date',
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Choose the time and slot',
              style: darkGreyTextStyle.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          // calendar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              children: [
                CalendarMonthWidget(
                  calendarFormat: state.calendarFormat,
                  onSelected: (index) => state.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                ),
                SizedBox(width: defaultMargin),
                CircleButtonTransparentWidget(
                  onTap: () => state.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  widget: Center(
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      color: kDarkgreyColor,
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
                  widget: Center(
                    child: SvgPicture.asset(
                      'assets/icons/forward.svg',
                      color: kDarkgreyColor,
                    ),
                  ),
                  borderColor: kGreyColor,
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CalendarPickerWidget(
              pageController: logic.setController,
              calendarMode: CalendarFormat.month,
              cellColor: kWhiteColor,
              cellMargin: 3,
              onDaySelected: (data) => state.selectedDate = data,
              selectedDays: state.selectedDate,
              fixedMode: true,
            ),
          ),
          const SizedBox(height: 6),
          // option hour
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: [
                  SizedBox(width: defaultMargin),
                  ...state.optionHour.map(
                    (data) => SelectedContainerWidget(
                      title: '$data hr',
                      isSelected: data == state.selectedHour.value,
                      onTap: () {
                        state.selectedHour.value = data;
                        state.closeTime.value = TimeOfDay(
                          hour: state.openTime.value.hour + data,
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
            child: ChooseTimeWidget(
              openTime: state.openTime,
              closeTime: state.closeTime,
              totalHour: state.selectedHour.value,
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
          ),
        ],
      ),
    );
  }
}
