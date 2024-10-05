import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/sales/sales_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/sales_item_card.dart';

import '../../../../utility/shared/widgets/tab_bar_widget.dart';
import '../../../../utility/shared/widgets/text_border.dart';

class SalesUi extends StatelessWidget {
  final logic = Get.find<SalesLogic>();
  final state = Get.find<SalesLogic>().state;
  SalesUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget salesContainer() {
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
                'Today',
                style: darkGreyTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                'RM120',
                style:
                    blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
              ),
              Row(
                children: [
                  TextBorder(
                    textTitle: '- 5%',
                    fontSize: 11,
                    textColor: kRedColor,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'vs yesterday',
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

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(defaultMargin),
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
                onTap: () {},
                widget: Icon(
                  Icons.file_upload_outlined,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),

          // chart
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: 8,
              bottom: defaultMargin,
            ),
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: kModalColor,
              border: Border.all(width: 1, color: kWhiteColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    salesContainer(),
                    const SizedBox(width: 12),
                    salesContainer(),
                    const SizedBox(width: 8),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circularInfoButton(title: 'Week 3'),
                    SizedBox(width: defaultMargin),
                    circularInfoButton(
                      title: 'Week 2',
                      color: kGreyColor,
                    ),
                    SizedBox(width: defaultMargin),
                    circularInfoButton(
                      title: 'Selected',
                      color: kBlackColor,
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: state.weeklyChart.activeChartList
                      .asMap()
                      .entries
                      .map(
                        (data) => Obx(() {
                          bool isActive =
                              state.weeklyChart.activeIndex.value == data.key &&
                                  state.weeklyChart.activeType.value == 0;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                state.weeklyChart.activeIndex.value = data.key;
                                state.weeklyChart.activeType.value = 0;
                              },
                              child: Container(
                                height: 120 * data.value,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  gradient: isActive ? null : mainGradient,
                                  color: isActive ? kBlackColor : null,
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.weeklyChart.inActiveChartList
                      .asMap()
                      .entries
                      .map(
                        (data) => Obx(() {
                          bool isActive =
                              state.weeklyChart.activeIndex.value == data.key &&
                                  state.weeklyChart.activeType.value == 1;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                state.weeklyChart.activeIndex.value = data.key;
                                state.weeklyChart.activeType.value = 1;
                              },
                              child: Container(
                                height: 120 * data.value,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: isActive ? kBlackColor : kMidgreyColor,
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.weeklyChart.titles
                      .asMap()
                      .entries
                      .map(
                        (data) => Expanded(
                          child: Obx(
                            () => Text(
                              data.value,
                              style: midGreyTextStyle.copyWith(
                                fontSize: 12,
                                color: state.weeklyChart.activeIndex.value ==
                                        data.key
                                    ? kBlackColor
                                    : kMidgreyColor,
                                fontWeight:
                                    state.weeklyChart.activeIndex.value ==
                                            data.key
                                        ? medium
                                        : reguler,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          TabbarWidget(
            tabBarTitle: state.tabBarTitle,
            tabActive: state.tabActive,
            onTap: (title) {
              state.tabActive.value = title;
              logic.alignmentTabbar(title);
            },
            alignment: state.activeAlignment,
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
                          SizedBox(width: defaultMargin),
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
                            style: darkGreyTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      if (data.value.totalData != 0)
                        for (int i = 0; i < data.value.totalData; i++)
                          const SalesItemCard(),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
