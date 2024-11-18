// ignore_for_file: deprecated_member_use

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/infrastructure/field/field_data_source.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/constants/global_variable.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

class CustomDialogSport {
  static Widget containerItem(
      {required String name, required String totalGame}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          const SizedBox(width: 8),
          TextBorder(
            textTitle: totalGame,
            paddingVertical: 0,
            paddingHorizontal: 7,
          ),
        ],
      ),
    );
  }

  static void showDialogSport() {
    final globalVariable = Get.find<GlobalVariable>();

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          height: Get.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kWhiteColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: ListView(
              children: FieldDataSource()
                  .listFieldModel
                  .asMap()
                  .entries
                  .map(
                    (data) => Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: data.key !=
                                  FieldDataSource().listFieldModel.length - 1
                              ? BorderSide(
                                  width: 1,
                                  color: kGreyColor,
                                )
                              : BorderSide.none,
                        ),
                      ),
                      child: ExpansionWidget(
                        titleBuilder: (double animationValue, _, bool isExpaned,
                                toogleFunction) =>
                            GestureDetector(
                          onTap: data.value.options == null
                              ? () {
                                  globalVariable.setSport(data.value, true);
                                  Get.back();
                                }
                              : () => toogleFunction(animated: true),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(defaultMargin),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  data.value.icon,
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  data.value.name,
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const TextBorder(
                                  textTitle: '234',
                                  paddingVertical: 0,
                                  paddingHorizontal: 7,
                                ),
                                const SizedBox(width: 8),
                                data.value.options != null
                                    ? SvgPicture.asset(
                                        isExpaned
                                            ? 'assets/icons/chevron-up.svg'
                                            : 'assets/icons/chevron-down.svg',
                                        width: 24,
                                        height: 24,
                                        color: kBlackColor,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        content: data.value.options != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          globalVariable.setSport(
                                              data.value, true);
                                          Get.back();
                                        },
                                        child: containerItem(
                                          name: data.value.options![0].name,
                                          totalGame: data
                                              .value.options![0].totalGame
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          globalVariable.setSport(
                                              data.value, false);
                                          Get.back();
                                        },
                                        child: containerItem(
                                          name: data.value.options![1].name,
                                          totalGame: data
                                              .value.options![1].totalGame
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
