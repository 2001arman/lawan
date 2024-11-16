import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/balance/checkout/balance_checkout_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../../utility/shared/widgets/navigations/payment_bottom_bar.dart';

class BalanceCheckoutUi extends StatelessWidget {
  static const String namePath = '/balance_checkout_page';
  final logic = Get.find<BalanceCheckoutLogic>();
  BalanceCheckoutUi({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'assets/icons/coin.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '500 Coin Topup',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(defaultMargin),
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
                            'assets/icons/currency.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Price',
                            style: darkGreyTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'RM42.50',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // bottom navbar
          Align(
            alignment: Alignment.bottomCenter,
            child: PaymentBottomBar(
              totalPayment: 'RM50.00',
              textButton: 'Pay Now',
              onTapPay: Get.back,
            ),
          )
        ],
      ),
    );
  }
}
