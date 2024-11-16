import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../admin/sales/sales_state.dart';

class BalanceState {
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Daily'.obs;
  List<String> tabBarTitle = [
    'Daily',
    'Weekly',
    'Monthly',
  ];

  var activeSalesAlignment = Alignment.centerLeft.obs;
  var salesTabActive = 'All'.obs;
  List<String> salesTitle = [
    'All',
    'Ongoing',
    'Complete',
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
