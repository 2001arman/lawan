// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_choose/ads_choose_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_ui.dart';
import 'package:lawan/features/presentation/settings/ads/ads_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';

import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_widget.dart';
import '../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../utility/shared/widgets/container/sales_section_container.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';

class AdsUi extends StatelessWidget {
  static const String namePath = '/ads_page';
  final logic = Get.find<AdsLogic>();
  final state = Get.find<AdsLogic>().state;
  AdsUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget adsCreditSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ads Credit',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'RM31.02',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
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
            CustomButton(
              isBlack: true,
              onTap: () => Get.toNamed(AdsChooseUi.namePath),
              title: 'Top Up',
              paddingVertical: 7.5,
            ),
          ],
        ),
      );
    }

    Widget tabbarSection() {
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
                  title: 'Advertisement',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                adsCreditSection(),
                Text(
                  'Overall Statistics',
                  style: darkGreyTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(height: defaultMargin),
                Obx(
                  () => Row(
                    children: state.statisticTypes
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomButton(
                              isBlack: state.selectedStatistic.value == data,
                              onTap: () => state.selectedStatistic.value = data,
                              title: data,
                              paddingVertical: 11.5,
                              paddingHorizontal: 12,
                              borderColor: kGreyColor,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: defaultMargin),
                tabbarSection(),
                SizedBox(height: defaultMargin),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 150),
                    children: [
                      Obx(
                        () => SalesSectionContainer(
                          titleBar: logic.titleBar(),
                          getChartModel: logic.getChartModel(),
                          color: kWhiteColor,
                          showRM: false,
                        ),
                      ),
                    ],
                  ),
                ),
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
                Platform.isIOS ? MediaQuery.of(context).padding.bottom : 12,
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
                    onTap: () => Get.toNamed(AdsCreateUi.namePath),
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
