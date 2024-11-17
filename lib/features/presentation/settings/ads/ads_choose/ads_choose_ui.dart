// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_checkout/ads_checkout_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_choose/ads_choose_logic.dart';
import 'package:lawan/features/presentation/settings/ads/ads_topup/ads_topup_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

import '../../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class AdsChooseUi extends StatelessWidget {
  static const String namePath = '/ads_choose_page';
  final logic = Get.find<AdsChooseLogic>();
  final state = Get.find<AdsChooseLogic>().state;
  AdsChooseUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget autoTopUpSection() {
      return GestureDetector(
        onTap: () => Get.toNamed(AdsTopupUi.namePath),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultMargin),
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Auto Top Up',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Off',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/icons/chevron-right.svg',
                color: kDarkgreyColor,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      );
    }

    Widget selectedItem({
      required String value,
    }) {
      return Obx(
        () => GestureDetector(
          onTap: () => state.selectedItem.value = value,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 19.5),
            decoration: BoxDecoration(
              color: state.selectedItem.value == value
                  ? kBlackColor
                  : kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                value,
                style: whiteTextStyle.copyWith(
                  color: state.selectedItem.value == value
                      ? kWhiteColor
                      : kBlackColor,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget inputItem() {
      return Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: 'Set an amount',
            hintStyle: darkGreyTextStyle.copyWith(fontSize: 11),
          ),
        ),
      );
    }

    Widget oneTimeTopupSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'One-Time Top Up',
              style: darkGreyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Text(
              'Select an amount of Ads Credit to add to your balance.',
              style: darkGreyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                Expanded(
                  child: selectedItem(value: '20.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '50.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '100.00'),
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                Expanded(
                  child: selectedItem(value: '500.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '700.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '1,000.00'),
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                Expanded(
                  child: selectedItem(value: '1,500.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '4,000.00'),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: selectedItem(value: '10,000.00'),
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                Expanded(
                  child: inputItem(),
                ),
                SizedBox(width: defaultMargin),
                const Expanded(child: SizedBox()),
                SizedBox(width: defaultMargin),
                const Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Padding(
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
                  title: 'Top Up',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                autoTopUpSection(),
                oneTimeTopupSection(),
              ],
            ),
          ),
          // bottom navbar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                defaultMargin,
                defaultMargin,
                defaultMargin,
                MediaQuery.of(context).padding.bottom,
              ),
              decoration: BoxDecoration(
                gradient: shadowGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GradientButton(
                    widget: Text(
                      'Create Ads',
                      style: whiteTextStyle,
                    ),
                    onTap: () => Get.toNamed(AdsCheckoutUi.namePath),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
