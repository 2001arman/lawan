import 'package:flutter/material.dart';
import 'package:lawan/features/admin/session/session_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/calendar_picker_widget.dart';
import 'package:lawan/utility/shared/widgets/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/custom_button.dart';
import 'package:lawan/utility/shared/widgets/gradient_circle_button.dart';
import 'package:lawan/utility/shared/widgets/session_item_card.dart';
import 'package:table_calendar/table_calendar.dart';

class SessionUi extends StatelessWidget {
  SessionUi({super.key});
  static const String namePath = '/testing';
  final logic = SessionLogic();
  final state = SessionLogic().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                CircleButtonTransparentWidget(
                  onTap: () => state.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  widget: const Center(child: Icon(Icons.arrow_back_ios)),
                  borderColor: kGreyColor,
                ),
                const SizedBox(width: 4),
                CircleButtonTransparentWidget(
                  onTap: () => state.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  widget: const Center(child: Icon(Icons.arrow_forward_ios)),
                  borderColor: kGreyColor,
                ),
                SizedBox(width: defaultMargin),
                CustomButton(
                  isBlack: true,
                  onTap: () {},
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: kMidgreyColor,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'September',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/icons/arrow_up_down.png',
                          width: 20,
                          height: 20,
                          color: kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: defaultMargin),
                GradientCircleButton(
                  onTap: logic.showAddArenaBottomSheet,
                ),
              ],
            ),
          ),
          CalendarPickerWidget(
            pageController: logic.setController,
            calendarMode: CalendarFormat.week,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                Column(
                    children: state.listSession
                        .map(
                          (data) => GestureDetector(
                            onTap: logic.showDetailArena,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: defaultMargin),
                                Row(
                                  children: [
                                    Text(
                                      data.date,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    SizedBox(width: defaultMargin),
                                    Text(
                                      data.dayName,
                                      style: darkGreyTextStyle,
                                    ),
                                  ],
                                ),
                                if (data.totalData == 0)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'No Session',
                                      style: darkGreyTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ),
                                for (int i = 0; i < data.totalData; i++)
                                  const SessionItemCard(),
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
