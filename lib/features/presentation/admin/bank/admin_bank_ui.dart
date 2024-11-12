import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/admin_main_ui.dart';
import 'package:lawan/features/presentation/admin/bank/admin_bank_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

class AdminBankUi extends StatelessWidget {
  static const String namePath = '/admin_bank_page';
  final logic = Get.find<AdminBankLogic>();
  final state = Get.find<AdminBankLogic>().state;
  AdminBankUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          MediaQuery.of(context).padding.top,
          defaultMargin,
          MediaQuery.of(context).padding.bottom + defaultMargin,
        ),
        child: Column(
          children: [
            CustomAppbar(
              title: '',
              iconColor: kBlackColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/hourglass-gradient.svg',
              height: 130,
            ),
            SizedBox(height: defaultMargin),
            Text(
              'Your submission is\nunder review.',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: medium),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              "We're processing your request\nYou'll hear from us soon.",
              style: darkGreyTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              isBlack: true,
              onTap: () => Get.offAllNamed(AdminMainUi.namePath),
              title: 'Back',
            ),
          ],
        ),
      ),
    );
  }
}
