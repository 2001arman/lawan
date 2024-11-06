import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/fields/field_image_widget.dart';
import 'package:lawan/utility/shared/widgets/navigations/payment_bottom_bar.dart';
import 'package:lawan/utility/util/helper.dart';

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
      body: SafeArea(
        top: false,
        child: Stack(
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
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: () => Get.back(),
                        widget: SvgPicture.asset(
                          'assets/icons/back.svg',
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

                  // image arena
                  SizedBox(height: defaultMargin),
                  FieldImageWidget(
                    arenaModel: logic.sessionModel.arena,
                    selectedCourt: logic.sessionModel.selectedCourt,
                    showInformation: true,
                    showLocation: false,
                  ),

                  // button session
                  const SizedBox(height: 12),
                  CustomButton(
                    width: double.infinity,
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
                          Helper.timeBetweenNowAndSession(
                              logic.sessionModel.dateTime),
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
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

                  Row(
                    children: [
                      CardDetailSession(
                        contentText:
                            Helper.formatFullDate(logic.sessionModel.dateTime),
                        title: 'Date',
                        icon: 'assets/icons/calendar.svg',
                        fontSize: 14,
                      ),
                      const SizedBox(width: 8),
                      CardDetailSession(
                        contentText:
                            '${Helper.formatTime12Hour(logic.sessionModel.startHour)} - ${Helper.formatTime12Hour(logic.sessionModel.endHour)}',
                        title: 'Time',
                        icon: 'assets/icons/clock.svg',
                        fontSize: 14,
                        description: '${logic.sessionModel.totalHour}hr',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CardDetailSession(
                        contentText: logic.sessionModel.arena.location,
                        title: 'Location',
                        icon: 'assets/icons/location.svg',
                        fontSize: 14,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 98,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: kGreyColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/currency.svg',
                                    // ignore: deprecated_member_use
                                    color: kDarkgreyColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Price',
                                    style: darkGreyTextStyle.copyWith(
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'RM20',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 20,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                  Text(
                                    '/pax',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                totalPayment: 'RM21.60',
                textButton: 'Pay Now',
                onTapPay: logic.onCreateSession,
              ),
            )
          ],
        ),
      ),
    );
  }
}
