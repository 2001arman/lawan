// ignore_for_file: deprecated_member_use

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lawan/features/admin/session/session_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/gradient_circle_button.dart';
import 'package:lawan/utility/shared/widgets/session_item_card.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class SessionUi extends StatefulWidget {
  SessionUi({super.key});
  static const String namePath = '/testing';
  final logic = SessionLogic();
  final state = SessionLogic().state;

  @override
  State<SessionUi> createState() => _SessionUiState();
}

final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  equals: isSameDay,
  hashCode: getHashCode,
);

// ignore: unused_element
late PageController _pageController;
RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
CalendarFormat _calendarFormat = CalendarFormat.month;

class _SessionUiState extends State<SessionUi> {
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDays.clear();
      _selectedDays.add(selectedDay);

      _focusedDay.value = focusedDay;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                CircleButtonTransparentWidget(
                  onTap: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  widget: const Center(child: Icon(Icons.arrow_back_ios)),
                  borderColor: kGreyColor,
                ),
                const SizedBox(width: 4),
                CircleButtonTransparentWidget(
                  onTap: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  widget: const Center(child: Icon(Icons.arrow_forward_ios)),
                  borderColor: kGreyColor,
                ),
                SizedBox(width: defaultMargin),
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
                        Text(
                          'September',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
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
                const GradientCircleButton(),
              ],
            ),
          ),
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            calendarStyle: CalendarStyle(
              rangeHighlightColor: kBlackColor,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBlackColor,
              ),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBlackColor,
              ),
            ),
            onDaySelected: _onDaySelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat == CalendarFormat.month) {
                setState(() => _calendarFormat = CalendarFormat.week);
              } else {
                setState(() => _calendarFormat = CalendarFormat.month);
              }
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                Column(
                    children: widget.state.listSession
                        .map(
                          (data) => GestureDetector(
                            onTap: widget.logic.showDetailArena,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: defaultMargin),
                                Row(
                                  children: [
                                    Text(
                                      data.date,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    SizedBox(width: defaultMargin),
                                    Text(
                                      data.dayName,
                                      style: darkGreyTextStyle,
                                    ),
                                  ],
                                ),
                                if (data.totalData == 0)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'No Session',
                                      style: darkGreyTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ),
                                for (int i = 0; i < data.totalData; i++)
                                  const SessionItemCard(),
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
