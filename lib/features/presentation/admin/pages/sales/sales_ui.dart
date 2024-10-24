// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/sales/sales_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/sales_item_card.dart';
import 'package:lawan/utility/util/custom_dialog.dart';

import '../../../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../../../utility/shared/widgets/text/text_border.dart';

class SalesUi extends StatelessWidget {
  final logic = Get.find<SalesLogic>();
  final state = Get.find<SalesLogic>().state;
  SalesUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget salesContainer({
      required String title,
      required String value,
      required String percent,
      required String infoData,
      required Color percentColor,
    }) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: kGreyColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                'RM$value',
                style:
                    blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  TextBorder(
                    textTitle: percent,
                    fontSize: 11,
                    textColor: percentColor,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'vs $infoData',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget circularInfoButton({required String title, Color? color}) {
      return Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: color == null ? mainGradient : null,
              color: color,
            ),
          ),
          Text(
            title,
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin / 2,
      ),
      child: Column(
        children: [
          Row(
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
                  backgroundColor: kBlackColor,
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
          ),
          SizedBox(height: defaultMargin),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // chart
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: 8,
                    bottom: defaultMargin,
                  ),
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: kModalColor,
                    border: Border.all(width: 1, color: kModalColor),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          salesContainer(
                            title: 'Today',
                            value: '120',
                            percent: '-5%',
                            infoData: 'yesterday',
                            percentColor: kRedColor,
                          ),
                          const SizedBox(width: 12),
                          salesContainer(
                            title: 'Weekly Sales',
                            value: '32,140',
                            percent: '12%',
                            infoData: 'last week',
                            percentColor: kGreenColor,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      SizedBox(height: defaultMargin),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circularInfoButton(title: logic.titleBar()[0]),
                            SizedBox(width: defaultMargin),
                            circularInfoButton(
                              title: logic.titleBar()[1],
                              color: kGreyColor,
                            ),
                            SizedBox(width: defaultMargin),
                            circularInfoButton(
                              title: logic.titleBar()[2],
                              color: kBlackColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: defaultMargin),
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: logic
                              .getChartModel()
                              .activeChartList
                              .asMap()
                              .entries
                              .map(
                                (data) => Obx(() {
                                  bool isActive = logic
                                              .getChartModel()
                                              .activeIndex
                                              .value ==
                                          data.key &&
                                      logic.getChartModel().activeType.value ==
                                          0;
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        logic
                                            .getChartModel()
                                            .activeIndex
                                            .value = data.key;
                                        logic.getChartModel().activeType.value =
                                            0;
                                      },
                                      child: Container(
                                        height: 120 * data.value,
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          gradient:
                                              isActive ? null : mainGradient,
                                          color: isActive ? kBlackColor : null,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: logic
                              .getChartModel()
                              .inActiveChartList
                              .asMap()
                              .entries
                              .map(
                                (data) => Obx(() {
                                  bool isActive = logic
                                              .getChartModel()
                                              .activeIndex
                                              .value ==
                                          data.key &&
                                      logic.getChartModel().activeType.value ==
                                          1;
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        logic
                                            .getChartModel()
                                            .activeIndex
                                            .value = data.key;
                                        logic.getChartModel().activeType.value =
                                            1;
                                      },
                                      child: Container(
                                        height: 120 * data.value,
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          color: isActive
                                              ? kBlackColor
                                              : kMidgreyColor,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: logic
                              .getChartModel()
                              .titles
                              .asMap()
                              .entries
                              .map(
                                (data) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Obx(
                                      () => Text(
                                        data.value,
                                        textAlign: TextAlign.center,
                                        style: midGreyTextStyle.copyWith(
                                          fontSize: 12,
                                          color: logic
                                                      .getChartModel()
                                                      .activeIndex
                                                      .value ==
                                                  data.key
                                              ? kBlackColor
                                              : kMidgreyColor,
                                          fontWeight: logic
                                                      .getChartModel()
                                                      .activeIndex
                                                      .value ==
                                                  data.key
                                              ? medium
                                              : reguler,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                TabbarWidget(
                  tabBarTitle: state.salesTitle,
                  tabActive: state.salesTabActive,
                  listNumber: const [null, 257, null],
                  onTap: (title) {
                    state.salesTabActive.value = title;
                    logic.salesAlignmentTabbar(title);
                  },
                  alignment: state.activeSalesAlignment,
                ),

                Column(
                  children: state.listSession
                      .asMap()
                      .entries
                      .map(
                        (data) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: defaultMargin),
                            Row(
                              children: [
                                Text(
                                  data.value.date,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(width: 55),
                                Text(
                                  data.value.dayName,
                                  style: darkGreyTextStyle,
                                ),
                              ],
                            ),
                            if (data.value.totalData == 0)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'No Session',
                                  style:
                                      darkGreyTextStyle.copyWith(fontSize: 12),
                                ),
                              ),
                            if (data.value.totalData != 0)
                              for (int i = 0; i < data.value.totalData; i++)
                                SalesItemCard(
                                  onTap: () =>
                                      CustomDialog().showRecipeDialog(),
                                ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
