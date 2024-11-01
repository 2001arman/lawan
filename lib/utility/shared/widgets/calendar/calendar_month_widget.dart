import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/calendar/calendar_picker_widget.dart';
import 'package:lawan/utility/util/custom_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthWidget extends StatelessWidget {
  final Rx<CalendarFormat> calendarFormat;
  final Function(int) onSelected;
  const CalendarMonthWidget({
    super.key,
    required this.calendarFormat,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: focusedDayData,
      builder: (context, value, _) {
        return Expanded(
          child: CustomButton(
            isBlack: true,
            onTap: () async {
              calendarFormat.value = CalendarFormat.month;
              await CustomDialog.chooseMonth(
                onSelected: onSelected,
                selectedMonth: value.month,
              );
            },
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    // ignore: deprecated_member_use
                    color: kWhiteColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat.MMMM().format(value),
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
        );
      },
    );
  }
}
