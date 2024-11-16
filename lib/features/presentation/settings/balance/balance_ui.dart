// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/balance/balance_logic.dart';
import 'package:lawan/features/presentation/settings/balance/checkout/balance_checkout_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/sales_section_container.dart';

import '../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';

class BalanceUi extends StatelessWidget {
  static const String namePath = '/balance_page';
  final logic = Get.find<BalanceLogic>();
  final state = Get.find<BalanceLogic>().state;
  BalanceUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget pointSection() {
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
              'Your Points',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/coin.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  '0',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '(10000 points = RM1)',
                    style: darkGreyTextStyle.copyWith(fontSize: 12),
                  ),
                ),
                CircleButtonTransparentWidget(
                  size: 40,
                  onTap: () {},
                  borderColor: kGreyColor,
                  widget: SvgPicture.asset(
                    'assets/icons/history.svg',
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isBlack: false,
                    onTap: () => Get.toNamed(BalanceCheckoutUi.namePath),
                    borderColor: kGreyColor,
                    title: 'Recharge',
                  ),
                ),
                SizedBox(width: defaultMargin),
                Expanded(
                  child: CustomButton(
                    isBlack: true,
                    onTap: () {},
                    title: 'Withdraw',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget gifterWidget() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.fromLTRB(
          12,
          8,
          defaultMargin,
          8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/avatars/avatar1.png',
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ali Qazwini',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  Text(
                    'Gift',
                    style: darkGreyTextStyle,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+20',
                  style: greenTextStyle.copyWith(fontWeight: medium),
                ),
                Text(
                  '3:35 PM',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget overallSection() {
      return Row(
        children: [
          Expanded(
            child: TabbarWidget(
              tabBarTitle: state.tabBarTitle,
              tabActive: state.tabActive,
              onTap: (title) {
                state.tabActive.value = title;
                logic.alignmentTabbar(title);
              },
              alignment: state.activeAlignment,
              activeColor: kWhiteColor,
              textActiveColor: kBlackColor,
              textInActiveColor: kDarkgreyColor,
            ),
          ),
          SizedBox(width: defaultMargin),
          CircleButtonWidget(
            onTap: logic.openPdfNetwork,
            widget: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/icons/upload.svg',
                width: 16,
                height: 16,
                color: kGreyColor,
              ),
            ),
          ),
        ],
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
          children: [
            CustomAppbar(
              title: 'Balance Overview',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: defaultMargin, bottom: 50),
                    children: [
                      pointSection(),
                      SizedBox(height: defaultMargin),
                      Text(
                        'Overall Statistics',
                        style: darkGreyTextStyle.copyWith(fontWeight: medium),
                      ),
                      SizedBox(height: defaultMargin),
                      overallSection(),
                      SizedBox(height: defaultMargin),
                      Obx(
                        () => SalesSectionContainer(
                          titleBar: logic.titleBar(),
                          getChartModel: logic.getChartModel(),
                          color: kWhiteColor,
                          showRM: false,
                        ),
                      ),
                      SizedBox(height: defaultMargin),
                      Row(
                        children: [
                          Text(
                            '24 Sep',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          const Spacer(),
                          Text(
                            '+1000',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      gifterWidget(),
                      gifterWidget(),
                      gifterWidget(),
                      gifterWidget(),
                    ],
                  ),
                  const HorizontalWhiteGradient(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
