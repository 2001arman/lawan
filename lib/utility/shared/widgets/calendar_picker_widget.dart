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

// ignore: must_be_immutable
class CalendarPickerWidget extends StatefulWidget {
  final Function(PageController)? pageController;
  CalendarFormat calendarMode;
  final Color? cellColor;
  final double cellMargin;
  CalendarPickerWidget({
    super.key,
    required this.pageController,
    required this.calendarMode,
    this.cellColor,
    this.cellMargin = 6.0,
  });

  @override
  State<CalendarPickerWidget> createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
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
      calendarFormat: widget.calendarMode,
      rangeSelectionMode: _rangeSelectionMode,
      calendarStyle: CalendarStyle(
        rangeHighlightColor: kBlackColor,
        cellMargin: EdgeInsets.all(widget.cellMargin),
        todayDecoration: BoxDecoration(
          color: kBlackColor,
          shape: BoxShape.circle,
        ),
        outsideDecoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.cellColor,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.cellColor,
        ),
        selectedDecoration: BoxDecoration(
          color: kBlackColor,
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: _onDaySelected,
      onCalendarCreated: widget.pageController,
      onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
      onFormatChanged: (format) {
        if (widget.calendarMode == CalendarFormat.month) {
          setState(() => widget.calendarMode = CalendarFormat.week);
        } else {
          setState(() => widget.calendarMode = CalendarFormat.month);
        }
      },
    );
  }
}
