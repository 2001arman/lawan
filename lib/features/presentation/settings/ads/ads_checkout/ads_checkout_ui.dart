// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../../utility/shared/widgets/navigations/payment_bottom_bar.dart';

class AdsCheckoutUi extends StatelessWidget {
  static const String namePath = '/ads_checkout_page';
  const AdsCheckoutUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget containerItem({
      required String icon,
      required String title,
      required String value,
      double fontSize = 14,
      bool showTextBorder = false,
    }) {
      return Expanded(
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: kGreyColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 16,
                    height: 16,
                    color: kDarkgreyColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: darkGreyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: blackTextStyle.copyWith(
                        fontSize: fontSize,
                        fontWeight: medium,
                        height: 18 / fontSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              showTextBorder
                  ? const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextBorder(
                        textTitle: '30d',
                        paddingVertical: 0,
                        paddingHorizontal: 6,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 204,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              MediaQuery.of(context).padding.top,
              defaultMargin,
              0,
            ),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Checkout',
                  iconColor: kWhiteColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(defaultMargin),
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: () {},
                        size: 48,
                        borderColor: kGreyColor,
                        widget: SvgPicture.asset(
                          'assets/icons/voucher.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Lawan Ads Topup',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),

                // items
                Row(
                  children: [
                    containerItem(
                      icon: 'assets/icons/calendar2.svg',
                      title: 'Date',
                      value: 'Tue,  25 Sep 2024',
                    ),
                    const SizedBox(width: 8),
                    containerItem(
                      icon: 'assets/icons/currency.svg',
                      title: 'Time',
                      value: '23 Sep 2024 - 23 Oct 2024',
                      fontSize: 12,
                      showTextBorder: true,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    containerItem(
                      icon: 'assets/icons/currency.svg',
                      title: 'Price',
                      value: 'RM20',
                      fontSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // bottom navbar
          Align(
            alignment: Alignment.bottomCenter,
            child: PaymentBottomBar(
              totalPayment: 'RM21.60 ',
              textButton: 'Pay Now',
              onTapPay: () => Get.close(2),
            ),
          )
        ],
      ),
    );
  }
}
