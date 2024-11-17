import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_topup/ads_topup_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class AdsTopupUi extends StatelessWidget {
  static const String namePath = '/ads_topup_page';
  final logic = Get.find<AdsTopupLogic>();
  final state = Get.find<AdsTopupLogic>().state;
  AdsTopupUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget autoTopUpSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(defaultMargin, 8, 8, 8),
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Auto Top Up',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                  height: 32,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Switch(
                      value: state.isAutoTopup.value,
                      onChanged: (active) => state.isAutoTopup.value = active,
                      activeColor: kWhiteColor,
                      activeTrackColor: kGreenColor,
                      inactiveThumbColor: kDarkgreyColor,
                      inactiveTrackColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          MediaQuery.of(context).padding.top,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: 'Auto Top Up',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            autoTopUpSection(),
            Text('When Balance Falls Below', style: darkGreyTextStyle),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: '0.00',
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RM', style: darkGreyTextStyle),
                ],
              ),
              controller: TextEditingController(),
            ),
            Center(
              child: Text(
                'The amount is between RM0.70 - RM200.00',
                textAlign: TextAlign.center,
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(height: defaultMargin),
            Text('Top Up Amount', style: darkGreyTextStyle),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: '0.00',
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RM', style: darkGreyTextStyle),
                ],
              ),
              controller: TextEditingController(),
            ),
            Center(
              child: Text(
                'The amount is between RM20.00 - RM5,000.00',
                textAlign: TextAlign.center,
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(height: defaultMargin),
            Text('Daily Cap', style: darkGreyTextStyle),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: '0.00',
              suffix: Padding(
                padding: EdgeInsets.only(right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Optional',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              showSuffix: true,
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RM', style: darkGreyTextStyle),
                ],
              ),
              controller: TextEditingController(),
            ),
            Center(
              child: Text(
                'The amount is between RM20.00 - RM1,500.00',
                textAlign: TextAlign.center,
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }
}
