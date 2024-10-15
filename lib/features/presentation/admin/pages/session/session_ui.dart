// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/calendar_picker_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';
import 'package:lawan/utility/shared/widgets/session_item_card.dart';
import 'package:table_calendar/table_calendar.dart';

class SessionUi extends StatelessWidget {
  SessionUi({super.key});
  static const String namePath = '/session_page';
  final logic = Get.find<SessionLogic>();
  final state = Get.find<SessionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin,
            top: defaultMargin / 2,
          ),
          child: Row(
            children: [
              CircleButtonTransparentWidget(
                onTap: () => state.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                widget: Center(
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                    color: kDarkgreyColor,
                    width: 16,
                    height: 16,
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
                    width: 16,
                    height: 16,
                  ),
                ),
                borderColor: kGreyColor,
              ),
              SizedBox(width: defaultMargin),
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
              GradientCircleButton(
                onTap: logic.showAddSessionBottomSheet,
              ),
            ],
          ),
        ),
        CalendarPickerWidget(
          pageController: logic.setController,
          calendarMode: CalendarFormat.week,
          onDaySelected: (_) {},
        ),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Column(
                children: state.listSession
                    .asMap()
                    .entries
                    .map(
                      (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: defaultMargin),
                          Row(
                            children: [
                              Text(
                                data.value.date,
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(width: 25),
                              Text(
                                data.value.dayName,
                                style: darkGreyTextStyle,
                              ),
                            ],
                          ),
                          if (data.value.sessionsData.isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'No Session',
                                style: darkGreyTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          if (data.value.sessionsData.isNotEmpty)
                            Column(
                              children: data.value.sessionsData
                                  .asMap()
                                  .entries
                                  .map(
                                    (session) => GestureDetector(
                                      onTap: () => logic.showDetailSession(
                                        sessionData: session.value,
                                        sessionIndex: session.key,
                                        dateIndex: data.key,
                                      ),
                                      child: SessionItemCard(
                                        sessionData: session.value,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        )
      ],
    );
  }
}
