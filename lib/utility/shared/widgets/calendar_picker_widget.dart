import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/constants_ui.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final ValueNotifier<DateTime> focusedDayData = ValueNotifier(DateTime.now());
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// ignore: must_be_immutable
class CalendarPickerWidget extends StatefulWidget {
  final Function(PageController)? pageController;
  final Function(DateTime) onDaySelected;
  CalendarFormat calendarMode;
  final Color? cellColor;
  final double cellMargin;
  CalendarPickerWidget({
    super.key,
    required this.pageController,
    required this.calendarMode,
    this.cellColor,
    this.cellMargin = 6.0,
    required this.onDaySelected,
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
    widget.onDaySelected(selectedDay);
    setState(() {
      _selectedDays.clear();
      _selectedDays.add(selectedDay);

      focusedDayData.value = selectedDay;
      _rangeSelectionMode = RangeSelectionMode.disabled;
    });
  }

  @override
  void initState() {
    _selectedDays.clear();
    _selectedDays.add(kToday);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: focusedDayData.value,
      headerVisible: false,
      selectedDayPredicate: (day) => _selectedDays.contains(day),
      calendarFormat: widget.calendarMode,
      rangeSelectionMode: _rangeSelectionMode,
      calendarStyle: CalendarStyle(
        rangeHighlightColor: kBlackColor,
        cellMargin: EdgeInsets.all(widget.cellMargin),
        todayDecoration: BoxDecoration(
          color: kBlackColor.withOpacity(0.4),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        outsideDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
        ),
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          color: widget.cellColor,
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          color: widget.cellColor,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBlackColor,
          shape: BoxShape.rectangle,
        ),
      ),
      onDaySelected: _onDaySelected,
      onCalendarCreated: widget.pageController,
      onPageChanged: (focusedDay) => focusedDayData.value = focusedDay,
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
