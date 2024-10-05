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
}
