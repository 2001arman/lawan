// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/admin/pages/session/session_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/calendar/calendar_picker_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';
import 'package:lawan/utility/shared/widgets/session_item_card.dart';

import '../../../../../utility/shared/widgets/calendar/calendar_month_widget.dart';

class SessionUi extends StatelessWidget {
  SessionUi({super.key});
  static const String namePath = '/session_page';
  final logic = Get.find<SessionLogic>();
  final state = Get.find<SessionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin,
            top: defaultMargin / 2,
          ),
          child: Row(
            children: [
              CircleButtonTransparentWidget(
                onTap: () => state.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                widget: Center(
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                    color: kDarkgreyColor,
                    width: 16,
                    height: 16,
                  ),
                ),
                borderColor: kGreyColor,
              ),
              const SizedBox(width: 4),
              CircleButtonTransparentWidget(
                onTap: () {
                  state.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                  // focusedDayData.
                },
                widget: Center(
                  child: SvgPicture.asset(
                    'assets/icons/forward.svg',
                    color: kDarkgreyColor,
                    width: 16,
                    height: 16,
                  ),
                ),
                borderColor: kGreyColor,
              ),
              SizedBox(width: defaultMargin),
              CalendarMonthWidget(
                calendarFormat: state.calendarFormat,
                onSelected: (index) => state.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
              ),
              SizedBox(width: defaultMargin),
              GradientCircleButton(
                onTap: logic.showAddSessionBottomSheet,
              ),
            ],
          ),
        ),
        Obx(
          () => CalendarPickerWidget(
            pageController: logic.setController,
            calendarMode: state.calendarFormat.value,
            onDaySelected: (_) {},
          ),
        ),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
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
                              const SizedBox(width: 25),
                              Text(
                                data.value.dayName,
                                style: darkGreyTextStyle,
                              ),
                            ],
                          ),
                          if (data.value.sessionsData.isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'No Session',
                                style: darkGreyTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          if (data.value.sessionsData.isNotEmpty)
                            Column(
                              children: data.value.sessionsData
                                  .asMap()
                                  .entries
                                  .map(
                                    (session) => GestureDetector(
                                      onTap: () => logic.showDetailSession(
                                        sessionData: session.value,
                                        sessionIndex: session.key,
                                        dateIndex: data.key,
                                      ),
                                      child: SessionItemCard(
                                        sessionData: session.value,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        )
      ],
    );
  }
}
