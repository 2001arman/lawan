import 'package:flutter/material.dart';
import 'package:lawan/features/presentation/admin/sales/sales_state.dart';

class SalesLogic {
  SalesState state = SalesState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Weekly':
        state.activeAlignment.value = Alignment.centerLeft;
        break;
      case 'Monthly':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Yearly':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }

  void salesAlignmentTabbar(String title) {
    switch (title) {
      case 'All':
        state.activeSalesAlignment.value = Alignment.centerLeft;
        break;
      case 'Ongoing':
        state.activeSalesAlignment.value = Alignment.center;
        break;
      default:
        state.activeSalesAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  ChartModel getChartModel() {
    switch (state.tabActive.value) {
      case 'Weekly':
        return state.weeklyChart;
      case 'Monthly':
        return state.monthlyChart;
      default:
        return state.yearlyChart;
    }
  }
}
