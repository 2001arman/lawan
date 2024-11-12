import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_logic.dart';

class AdminBankUi extends StatelessWidget {
  static const String namePath = '/admin_bank_page';
  final logic = Get.find<AdminBankLogic>();
  final state = Get.find<AdminBankLogic>().state;
  AdminBankUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
