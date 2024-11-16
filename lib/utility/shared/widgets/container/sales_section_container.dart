import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../features/presentation/admin/sales/sales_state.dart';
import '../../constants/constants_ui.dart';
import '../text/text_border.dart';

class SalesSectionContainer extends StatelessWidget {
  final List<String> titleBar;
  final ChartModel getChartModel;
  final Color color;
  final bool showRM;
  const SalesSectionContainer({
    super.key,
    required this.titleBar,
    required this.getChartModel,
    required this.color,
    required this.showRM,
  });

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
                '${showRM ? 'RM' : ''}$value',
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

    return Container(
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
        color: color,
        border: Border.all(width: 1, color: color),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circularInfoButton(title: titleBar[0]),
              SizedBox(width: defaultMargin),
              circularInfoButton(
                title: titleBar[1],
                color: kGreyColor,
              ),
              SizedBox(width: defaultMargin),
              circularInfoButton(
                title: titleBar[2],
                color: kBlackColor,
              ),
            ],
          ),
          SizedBox(height: defaultMargin),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: getChartModel.activeChartList
                .asMap()
                .entries
                .map(
                  (data) => Obx(() {
                    bool isActive =
                        getChartModel.activeIndex.value == data.key &&
                            getChartModel.activeType.value == 0;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          getChartModel.activeIndex.value = data.key;
                          getChartModel.activeType.value = 0;
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
            children: getChartModel.inActiveChartList
                .asMap()
                .entries
                .map(
                  (data) => Obx(() {
                    bool isActive =
                        getChartModel.activeIndex.value == data.key &&
                            getChartModel.activeType.value == 1;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          getChartModel.activeIndex.value = data.key;
                          getChartModel.activeType.value = 1;
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
            children: getChartModel.titles
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
                            color: getChartModel.activeIndex.value == data.key
                                ? kBlackColor
                                : kMidgreyColor,
                            fontWeight:
                                getChartModel.activeIndex.value == data.key
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
        ],
      ),
    );
  }
}
