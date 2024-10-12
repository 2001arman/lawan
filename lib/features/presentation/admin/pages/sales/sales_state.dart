import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../utility/util/helper.dart';

class SalesState {
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Weekly'.obs;
  List<String> tabBarTitle = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  var activeSalesAlignment = Alignment.centerLeft.obs;
  var salesTabActive = 'All'.obs;
  List<String> salesTitle = [
    'All',
    'Ongoing',
    'Complete',
  ];

  ChartModel weeklyChart = ChartModel(
    activeChartList: [0.5, 0.8, 0.7, 0.6, 0.7, 1, 0.0],
    inActiveChartList: [0.5, 0.8, 0.7, 0.6, 0.7, 1, 0.7],
    titles: [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ],
    activeIndex: 5.obs,
    activeType: 0.obs,
  );

  ChartModel monthlyChart = ChartModel(
    activeChartList: [0.5, 0.8, 1, 0.0],
    inActiveChartList: [0.5, 0.8, 0.9, 0.6],
    titles: [
      'Week 1',
      'Week 2',
      'Week 3',
      'Week 4',
    ],
    activeIndex: 1.obs,
    activeType: 0.obs,
  );

  ChartModel yearlyChart = ChartModel(
    activeChartList: [0.3, 0.5, 0.4, 0.3, 0.6, 0.7, 0.7, 1, 0, 0, 0, 0],
    inActiveChartList: [
      0.3,
      0.5,
      0.4,
      0.3,
      0.6,
      0.7,
      0.7,
      1,
      0.7,
      0.7,
      0.7,
      0.7
    ],
    titles: List.generate(12, (index) => '${index + 1}'),
    activeIndex: 7.obs,
    activeType: 0.obs,
  );

  var listSession = List.generate(
    7,
    (index) {
      DateTime now = DateTime.now().add(Duration(days: index));
      return SalesData(
        date: DateFormat('dd MMM').format(now), // Date as '23 Sep'
        dayName: Helper.formatDayName(index), // Day name like 'Mon, Today'
        totalData: index, // Example totalData
      );
    },
  ).obs;
}

class SalesData {
  final String date;
  final String dayName;
  final int totalData;

  SalesData({
    required this.date,
    required this.dayName,
    required this.totalData,
  });
}

class ChartModel {
  final List<double> activeChartList;
  final List<double> inActiveChartList;
  final List<String> titles;
  final RxInt activeIndex;
  final RxInt activeType; // 0 active chart 1 inActiveChart

  ChartModel({
    required this.activeChartList,
    required this.inActiveChartList,
    required this.titles,
    required this.activeIndex,
    required this.activeType,
  });
}
