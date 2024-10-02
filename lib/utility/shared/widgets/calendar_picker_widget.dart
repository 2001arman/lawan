import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/constants_ui.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalendarPickerWidget extends StatefulWidget {
  final Function(PageController)? pageController;
  const CalendarPickerWidget({super.key, required this.pageController});

  @override
  State<CalendarPickerWidget> createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  CalendarFormat _calendarFormat = CalendarFormat.month;
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
    return TableCalendar(
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
      onCalendarCreated: widget.pageController,
      onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
      onFormatChanged: (format) {
        if (_calendarFormat == CalendarFormat.month) {
          setState(() => _calendarFormat = CalendarFormat.week);
        } else {
          setState(() => _calendarFormat = CalendarFormat.month);
        }
      },
    );
  }
}
