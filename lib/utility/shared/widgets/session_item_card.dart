import 'package:flutter/material.dart';
import 'package:lawan/features/domain/session/session_model.dart';
import 'package:lawan/utility/shared/widgets/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/text_boder.dart';
import 'package:lawan/utility/util/helper.dart';

import '../constants/constants_ui.dart';

class SessionItemCard extends StatelessWidget {
  final SessionModel sessionData;

  const SessionItemCard({super.key, required this.sessionData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${Helper.formatTime12Hour(sessionData.startHour)}\n-\n${Helper.formatTime12Hour(sessionData.endHour)}',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextBoder(textTitle: '${sessionData.totalHour} hr'),
            ],
          ),
          Container(
            width: 1,
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: kBlackColor,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/avatars_image.png',
                      width: 72,
                      height: 24,
                    ),
                    const SizedBox(width: 14),
                    Icon(
                      Icons.group_outlined,
                      color: kMidgreyColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '8/28',
                      style: darkGreyTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                FieldNumberWidget(
                  court: sessionData
                      .arena.courtData[sessionData.selectedCourt].courtName,
                ),
                const SizedBox(height: 8),
                Text(
                  sessionData.arena.name,
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: kGreyColor),
            ),
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: kDarkgreyColor,
            ),
          )
        ],
      ),
    );
  }
}
