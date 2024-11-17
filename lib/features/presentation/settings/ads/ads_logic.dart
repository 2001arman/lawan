import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_state.dart';

import '../../admin/sales/sales_state.dart';
import '../../pdf_view.dart';

class AdsLogic extends GetxController {
  AdsState state = AdsState();

  void alignmentTabbar(String title) {
    switch (title) {
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

  void openPdfNetwork() {
    Get.to(const PdfView());
  }

  List<String> titleBar() {
    switch (state.tabActive.value) {
      case 'Monthly':
        return ['Sep ', 'Aug', 'Selected'];
      case 'Yearly':
        return ['2024', '2023', 'Selected'];
      default:
        return ['Week 3', 'Week 2', 'Selected'];
    }
  }

  ChartModel getChartModel() {
    switch (state.tabActive.value) {
      case 'Monthly':
        return state.weeklyChart;
      case 'Yearly':
        return state.monthlyChart;
      default:
        return state.dailyChart;
    }
  }
}
