// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../constants/constants_ui.dart';

class LeaderboardTabbarWidget extends StatelessWidget {
  const LeaderboardTabbarWidget({
    super.key,
    required this.tabBarTitle,
    required this.tabActive,
    required this.onTap,
    required this.alignment,
    this.backgroundColor,
    this.activeColor,
    this.textActiveColor,
    this.textInActiveColor,
    this.tabBarIcon,
    this.selectedWidth,
    this.iconSize,
    this.listNumber,
    this.useIconColor = true,
    this.useMarginRight = true,
  });

  final double? selectedWidth, iconSize;
  final List<int?>? listNumber;
  final List<String> tabBarTitle;
  final List<String?>? tabBarIcon;
  final RxString tabActive;
  final Rx<AlignmentGeometry> alignment;
  final Color? backgroundColor, activeColor, textActiveColor, textInActiveColor;
  final bool useIconColor, useMarginRight;
  final Function(String title) onTap;

  @override
  Widget build(BuildContext context) {
    Widget item({required String value, required int index}) {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(value),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (tabBarIcon != null && tabBarIcon?[index] != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: SvgPicture.asset(
                          tabBarIcon![index]!,
                          color: useIconColor
                              ? tabActive.value == value
                                  ? textActiveColor ?? kDarkgreyColor
                                  : textInActiveColor ?? kDarkgreyColor
                              : null,
                          width: iconSize,
                          height: iconSize,
                        ),
                      ),
                    Text(
                      value,
                      style: greyTextStyle.copyWith(
                        color: tabActive.value == value
                            ? textActiveColor ?? kBlackColor
                            : textInActiveColor ?? kDarkgreyColor,
                        fontWeight: tabActive.value == value ? medium : reguler,
                      ),
                    ),
                    if (listNumber != null && listNumber?[index] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: TextBorder(
                          textTitle: listNumber![index]!.toString(),
                          paddingHorizontal: 6,
                          paddingVertical: 0,
                          borderColor: kWhiteColor,
                          textColor: kDarkgreyColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget containerItem() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(right: useMarginRight ? 30 : 0),
          child: AnimatedAlign(
            alignment: alignment.value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: useMarginRight ? constraints.maxWidth / 3 : 30,
                    decoration: BoxDecoration(
                      color: activeColor ?? kWhiteColor,
                      borderRadius:
                          useMarginRight ? BorderRadius.circular(100) : null,
                      shape:
                          useMarginRight ? BoxShape.rectangle : BoxShape.circle,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      '',
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? kGreyColor,
      ),
      child: Stack(
        children: [
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                containerItem(),
              ],
            ),
          ),
          Obx(
            () => Row(children: [
              item(value: tabBarTitle[0], index: 0),
              item(value: tabBarTitle[1], index: 1),
              item(value: tabBarTitle[2], index: 2),
              GestureDetector(
                onTap: () => onTap(tabBarTitle[3]),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: SvgPicture.asset(
                      tabBarIcon![3]!,
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
