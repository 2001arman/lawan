import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/sales/sales_state.dart';

class AdsState {
  RxString selectedStatistic = 'Reach'.obs;
  List<String> statisticTypes = [
    'Reach',
    'Clicks',
    'CPC',
    'Amount Spent',
  ];

  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Weekly'.obs;
  List<String> tabBarTitle = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  ChartModel dailyChart = ChartModel(
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

  ChartModel weeklyChart = ChartModel(
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

  ChartModel monthlyChart = ChartModel(
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
}
