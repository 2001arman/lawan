import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/payment_page.dart';

import '../../constants/constants_ui.dart';
import '../buttons/gradient_button.dart';

class PaymentBottomBar extends StatelessWidget {
  const PaymentBottomBar({
    super.key,
    this.useCoin = false,
    required this.totalPayment,
    required this.textButton,
    required this.onTapPay,
  });
  final bool useCoin;
  final String totalPayment, textButton;
  final VoidCallback onTapPay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        Platform.isIOS ? MediaQuery.of(context).padding.bottom : 12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kBlackColor.withOpacity(0),
            kBlackColor.withOpacity(0.3),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(
              PaymentPage.namePath,
              arguments: [true],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 8,
              ),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: kModalColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(useCoin
                      ? 'assets/icons/coin.svg'
                      : 'assets/icons/voucher.svg'),
                  const SizedBox(width: 4),
                  Text(
                    useCoin ? 'Recharge' : 'Voucher',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Change',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    weight: 5,
                    color: kDarkgreyColor,
                    size: 13,
                  ),
                  SvgPicture.asset('assets/icons/mastercard.svg'),
                  Text(
                    '7041',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: kGreyColor),
              borderRadius: BorderRadius.circular(40),
              color: kModalColor,
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Payment',
                      style: darkGreyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: useCoin,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset('assets/icons/coin.svg'),
                          ),
                        ),
                        Text(
                          totalPayment,
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                            height: 1,
                          ),
                        ),
                        Visibility(
                          visible: !useCoin,
                          child: Text(
                            ' (incl. SST)',
                            style: darkGreyTextStyle.copyWith(
                              fontWeight: reguler,
                              fontSize: 12,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GradientButton(
                  onTap: onTapPay,
                  widget: Text(
                    textButton,
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
