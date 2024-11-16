import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/balance/balance_state.dart';

import '../../admin/sales/sales_state.dart';
import '../../pdf_view.dart';

class BalanceLogic extends GetxController {
  BalanceState state = BalanceState();

  List<String> titleBar() {
    switch (state.tabActive.value) {
      case 'Weekly':
        return ['Sep ', 'Aug', 'Selected'];
      case 'Monthly':
        return ['2024', '2023', 'Selected'];
      default:
        return ['Week 3', 'Week 2', 'Selected'];
    }
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
        return state.dailyChart;
    }
  }

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Weekly':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Monthly':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }

  void openPdfNetwork() {
    Get.to(const PdfView());
  }
}
