import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_logic.dart';
import 'package:lawan/features/presentation/player/payment/payment/pages/payment_page.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/fields/field_image_widget.dart';

import '../../../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../../../utility/shared/widgets/card_detail_session.dart';
import '../../../../../../utility/shared/widgets/text/text_pill_widget.dart';

class CheckoutUi extends StatelessWidget {
  static const String namePath = '/checkout_page';
  final logic = Get.find<CheckoutLogic>();
  CheckoutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          // background gradient
          Container(
            width: double.infinity,
            height: Get.height * 0.4,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // appbar
                SizedBox(height: MediaQuery.paddingOf(context).top),
                Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: () => Get.back(),
                      widget: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(width: defaultMargin),
                    Text(
                      'Checkout',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),

                // button session starting
                SizedBox(height: defaultMargin),
                FieldImageWidget(
                  arenaModel: logic.arenaDataSource.listArena.first,
                  selectedCourt: 0,
                ),

                // button session
                const SizedBox(height: 12),
                Row(
                  children: [
                    CustomButton(
                      isBlack: true,
                      onTap: () {},
                      paddingVertical: 8,
                      widget: Column(
                        children: [
                          Text(
                            'Sesssion starting in',
                            style: midGreyTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            '2 days 2 hours 6 mins 3 sec',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // detail pill widget
                SizedBox(height: defaultMargin),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPillWidget(title: '25 - 35 years'),
                    SizedBox(width: 8),
                    TextPillWidget(title: 'Male & Female'),
                    SizedBox(width: 8),
                    TextPillWidget(title: 'English & Malay'),
                  ],
                ),

                // detail card session
                SizedBox(height: defaultMargin),
                const Row(
                  children: [
                    CardDetailSession(
                      contentText: 'Tue,  25 Sep 2024',
                      title: 'Date',
                      icon: Icons.date_range_outlined,
                      fontSize: 14,
                    ),
                    SizedBox(width: 8),
                    CardDetailSession(
                      contentText: '9:00 AM - 11:00 AM',
                      title: 'Time',
                      icon: Icons.access_time_outlined,
                      fontSize: 14,
                      description: '2 hr',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    CardDetailSession(
                      contentText: 'Petaling Jaya, Selangor',
                      title: 'Location',
                      icon: Icons.location_on_outlined,
                      fontSize: 14,
                    ),
                    SizedBox(width: 8),
                    CardDetailSession(
                      contentText: 'RM20/pax',
                      title: 'Price',
                      icon: Icons.monetization_on_outlined,
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
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: kGreyColor),
                      borderRadius: BorderRadius.circular(40),
                      color: kModalColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/voucher.svg'),
                        const SizedBox(width: 4),
                        Text(
                          'Voucher',
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
                                Text(
                                  'RM21.60 ',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: bold,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  '(incl. SST)',
                                  style: darkGreyTextStyle.copyWith(
                                    fontWeight: reguler,
                                    fontSize: 12,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GradientButton(
                          onTap: () => Get.toNamed(PaymentPage.namePath),
                          widget: Text(
                            'Pay Now',
                            style: whiteTextStyle.copyWith(fontWeight: medium),
                          ),
                        ),
                      ],
                    ),
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
