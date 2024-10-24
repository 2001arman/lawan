import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/checkout/controller/checkout_logic.dart';
import 'package:lawan/features/presentation/player/payment/payment/pages/payment_page.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/fields/field_image_widget.dart';
import 'package:lawan/utility/util/helper.dart';

import '../../../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../../../utility/shared/widgets/card_detail_session.dart';
import '../../../../../../utility/shared/widgets/text/text_pill_widget.dart';
import '../../../../../domain/session/session_model.dart';
import '../../../../admin/pages/session/admin_session_bottom_sheet.dart';
import '../../../controller/player_main_state.dart';

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
                                  style:
                                      darkGreyTextStyle.copyWith(fontSize: 12),
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
                  GestureDetector(
                    onTap: () => Get.toNamed(
                      PaymentPage.namePath,
                      arguments: Get.arguments,
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
                          onTap: () async {
                            SessionModel sessionModel = Get.arguments[0];
                            PlayerMainState playerMainState = Get.arguments[1];

                            playerMainState.sessionList.add(sessionModel);

                            Get.close(2);
                            await Future.delayed(const Duration(seconds: 1));
                            AdminSessionBottomSheet()
                                .successCreateSesssionSheet(
                              arenaModel: sessionModel.arena,
                              selectedCourt: sessionModel.selectedCourt,
                              session: sessionModel,
                              showPill: true,
                              successCreate: true,
                              isAdmin: false,
                            );
                          },
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
