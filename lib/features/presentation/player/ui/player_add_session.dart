// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/presentation/player/ui/player_add_player_bottom_sheet.dart';
import 'package:lawan/features/presentation/player/controller/player_main_logic.dart';
import 'package:lawan/features/presentation/player/controller/player_main_state.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/fields/select_field_image_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/selected_container_widget.dart';
import 'package:lawan/utility/shared/widgets/wheel_picker/choose_age_widget.dart';
import 'package:lawan/utility/shared/widgets/wheel_picker/choose_slot_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/calendar_picker_widget.dart';
import '../../../../utility/shared/widgets/wheel_picker/choose_time_widget.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../domain/session/avatar_model.dart';

class PlayerAddSession {
  final PlayerMainState state;
  final PlayerMainLogic logic;

  PlayerAddSession({required this.state, required this.logic});

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

  void createNewSession() {
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
                      0,
                      defaultMargin,
                      defaultMargin,
                    ),
                    child: Row(
                      children: [
                        CustomButton(
                          title: 'Cancel',
                          isBlack: false,
                          onTap: () => Get.back(),
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          title: state.selectedIndex.value == 3
                              ? 'Proceed to Pay'
                              : 'Next',
                          isBlack: true,
                          onTap: logic.handleNextButton,
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

  Widget selectedFriendItem({required AvatarModel data}) {
    return GestureDetector(
      onTap: () {
        state.selectedFriends.remove(data);
        state.listFriends.add(data);
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
                    onTap: () => PlayerAddPlayerBottomSheet(
                      logic: logic,
                      state: state,
                    ).addPlayerBottomSheet(),
                    borderColor: kGreyColor,
                    size: 44,
                    widget: SvgPicture.asset(
                      'assets/icons/add_user.svg',
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
          Row(
            children: [
              Text('Gender', style: darkGreyTextStyle),
              SizedBox(width: Get.width * 0.2),
              CustomButton(
                isBlack: true,
                onTap: () {},
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male_outlined,
                      color: kWhiteColor,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text('Male', style: whiteTextStyle),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              CustomButton(
                isBlack: false,
                onTap: () {},
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female_outlined,
                      color: kBlackColor,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text('Female',
                        style: whiteTextStyle.copyWith(color: kBlackColor)),
                  ],
                ),
              ),
            ],
          ),

          // language
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Language', style: darkGreyTextStyle),
              SizedBox(width: Get.width * 0.15),
              CustomButton(
                isBlack: true,
                onTap: () {},
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/uk.png', width: 16),
                    const SizedBox(width: 4),
                    Text('English', style: whiteTextStyle),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              CustomButton(
                isBlack: false,
                onTap: () {},
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/malaysia.png', width: 16),
                    const SizedBox(width: 4),
                    Text('Malay',
                        style: whiteTextStyle.copyWith(color: kBlackColor)),
                  ],
                ),
              ),
            ],
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
                CustomButton(
                  isBlack: true,
                  onTap: () {},
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget arenaSection() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                flex: 2,
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
              CustomButton(
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
            ],
          ),
          SizedBox(height: defaultMargin),
          Obx(
            () => Column(
              children: logic.arenaDataSource.listArena
                  .asMap()
                  .entries
                  .map(
                    (data) => GestureDetector(
                      onTap: () {
                        state.selectedArenaIndex.value = data.key;
                        state.selectedCourtIndex.value = 0;
                      },
                      child: SelectFieldImageWidget(
                        arenaModel: data.value,
                        isSelected: data.key == state.selectedArenaIndex.value,
                        onChangeCourt: (courtIndex) =>
                            state.selectedCourtIndex.value = courtIndex,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
