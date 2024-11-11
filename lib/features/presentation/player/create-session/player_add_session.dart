// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/features/presentation/player/create-session/player_add_session_state.dart';
import 'package:lawan/features/presentation/player/create-session/player_add_bottom_sheet.dart';
import 'package:lawan/utility/shared/constants/session_type.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/fields/choose_arena_section_modal.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/inputs/choose_gender_widget.dart';
import 'package:lawan/utility/shared/widgets/inputs/choose_language_widget.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:lawan/utility/shared/widgets/wheel_picker/choose_age_widget.dart';
import 'package:lawan/utility/shared/widgets/wheel_picker/choose_slot_widget.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/calendar/calendar_month_widget.dart';
import '../../../../utility/shared/widgets/calendar/calendar_picker_widget.dart';
import '../../../../utility/shared/widgets/wheel_picker/choose_time_widget.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../domain/session/avatar_model.dart';
import 'player_add_session_logic.dart';

class PlayerAddSession {
  final PlayerAddSessionLogic logic = Get.find<PlayerAddSessionLogic>();
  final PlayerAddSessionState state = Get.find<PlayerAddSessionLogic>().state;
  final Function(SessionModel) onCreate;
  final RxList<AvatarModel> selectedFriends;
  final SessionType sessionType;

  PlayerAddSession({
    required this.onCreate,
    required this.selectedFriends,
    required this.sessionType,
  });

  Widget contentSection() {
    switch (state.selectedIndex.value) {
      case 1:
        return slotSection();
      case 2:
        return ChooseArenaSectionModal(
          onSelectedArena: logic.onSelectedArena,
          selectedArena: state.selectedArenaIndex,
          selectedCourt: state.selectedCourtIndex,
        );
      default:
        return detailSection();
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

  void createNewSession() {
    state.selectedFriends = selectedFriends;
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
            height: Get.height * 0.9,
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      defaultMargin,
                      defaultMargin,
                      0,
                    ),
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
                          title: 'Setting',
                          isActive: state.selectedIndex.value == 3,
                        ),
                      ],
                    ),
                  ),
                  contentSection(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      defaultMargin,
                      defaultMargin,
                      MediaQuery.of(Get.context!).padding.bottom,
                    ),
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
                            title: state.selectedIndex.value == 3
                                ? 'Proceed to Pay'
                                : 'Next',
                            isBlack: true,
                            onTap: () => logic.handleNextButton(
                              onCreate: onCreate,
                              sessionType: sessionType,
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
    );
  }

  Widget selectedFriendItem({required AvatarModel data}) {
    return GestureDetector(
      onTap: () {
        state.listFriends.add(data);
        state.selectedFriends.remove(data);
        Helper.showToast(
          isSuccess: true,
          message: 'User removed from invitation successfully',
        );
      },
      child: Container(
        width: 46,
        margin: const EdgeInsets.only(left: 8),
        child: Stack(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: kGreenColor,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: kGreyColor),
                image: DecorationImage(
                  image: AssetImage(data.asset),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: kGreyColor),
                ),
                child: const Icon(
                  Icons.close,
                  size: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailSection() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(height: defaultMargin),
          Text(
            'Session Setting',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Configure session preferences',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),

          // add friends
          const SizedBox(height: 16),
          Text('Invite Friend(s)', style: darkGreyTextStyle),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: [
                  CircleButtonTransparentWidget(
                    onTap: () {
                      Get.back();
                      PlayerAddBottomSheet().addPlayerBottomSheet(
                        onBack: () {
                          Get.back();
                          createNewSession();
                        },
                        onSave: (avatars) =>
                            state.selectedFriends.addAll(avatars),
                      );
                    },
                    borderColor: kGreyColor,
                    size: 44,
                    widget: SvgPicture.asset(
                      'assets/icons/user-plus-arena.svg',
                      color: kDarkgreyColor,
                    ),
                  ),
                  ...state.selectedFriends.map(
                    (data) => selectedFriendItem(data: data),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // gender
          ChooseGenderWidget(
            isMaleSelected: state.isMale,
            isFemaleSelected: state.isFemale,
          ),

          // language
          const SizedBox(height: 16),
          ChooseLanguageWidget(
            isMalaySelected: state.isMalay,
            isEnglishSelected: state.isEnglish,
          ),

          // age range
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Text('Age Range', style: darkGreyTextStyle),
                  const Spacer(),
                  Text('Enable', style: darkGreyTextStyle),
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Switch(
                        value: state.enableAge.value,
                        onChanged: (active) => state.enableAge.value = active,
                        activeColor: kWhiteColor,
                        activeTrackColor: kGreenColor,
                        inactiveThumbColor: kDarkgreyColor,
                        inactiveTrackColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              if (state.enableAge.value) const SizedBox(height: 8),
              Visibility(
                visible: state.enableAge.value,
                child: ChooseAgeWidget(
                  startAge: state.ageStart,
                  endAge: state.ageEnd,
                  onSave: (ageStart, ageEnd) {
                    state.ageStart.value = ageStart;
                    state.ageEnd.value = ageEnd;
                  },
                ),
              ),
            ],
          ),

          // Configure Slots
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Text('Configure Slots', style: darkGreyTextStyle),
                  const Spacer(),
                  Text('Enable', style: darkGreyTextStyle),
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Switch(
                        value: state.enableSlot.value,
                        onChanged: (active) {
                          state.enableSlot.value = active;
                        },
                        activeColor: kWhiteColor,
                        activeTrackColor: kGreenColor,
                        inactiveThumbColor: kDarkgreyColor,
                        inactiveTrackColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              if (state.enableSlot.value) const SizedBox(height: 8),
              Visibility(
                visible: state.enableSlot.value,
                child: ChooseSlotWidget(
                  startAge: state.slotStart,
                  endAge: state.slotEnd,
                  onSave: (slotStart, slotEnd) {
                    state.slotStart.value = slotStart;
                    state.slotEnd.value = slotEnd;
                  },
                ),
              ),
            ],
          ),

          //  price
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onTap: () {},
                  widget: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/tag.svg',
                        width: 18,
                      ),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price to pay',
                            style: midGreyTextStyle.copyWith(fontSize: 12),
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'RM20',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                              children: [
                                TextSpan(
                                  text: ' / pax',
                                  style: greyTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GradientButton(
                  onTap: () {},
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Extra Player(s)',
                        style: midGreyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '0',
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget slotSection() {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(height: defaultMargin),
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
                  widget: SvgPicture.asset(
                    'assets/icons/back.svg',
                    color: kBlackColor,
                  ),
                  borderColor: kGreyColor,
                ),
                const SizedBox(width: 4),
                CircleButtonTransparentWidget(
                  onTap: () => state.pageController.nextPage(
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
                pageController: logic.setController,
                calendarMode: state.calendarFormat.value,
                cellColor: kWhiteColor,
                cellMargin: 3,
                onDaySelected: (data) => state.selectedDate = data,
                selectedDays: state.selectedDate,
                fixedMode: true,
              ),
            ),
          ),

          const SizedBox(height: 8),
          // option hour
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(children: [
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
              ]),
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
