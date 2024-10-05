import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/widgets/field_number_widget.dart';
import 'package:lawan/utility/shared/widgets/text_border.dart';

import '../constants/constants_ui.dart';

class SalesItemCard extends StatelessWidget {
  final VoidCallback onTap;
  const SalesItemCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 183,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '+RM20',
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextBorder(
                  textTitle: 'Ongoing',
                  backgroundColor: kOrangeColor,
                  textColor: kWhiteColor,
                  borderColor: Colors.transparent,
                  paddingVertical: 2,
                ),
                Container(
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: kGreyColor),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'RM 180',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: kGreyColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      Text(
                        'RM 220',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: 1,
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              color: kBlackColor,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/icons/image_person.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Ali Qazwini',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const FieldNumberWidget(
                    court: '1',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'MBPJ Sports Complex',
                    style: darkGreyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: kMidgreyColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tue,  25 Sep 2024',
                        style:
                            darkGreyTextStyle.copyWith(fontSize: 12, height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: kMidgreyColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '9:00 AM - 11:00 AM ',
                        style:
                            darkGreyTextStyle.copyWith(fontSize: 12, height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const TextBorder(
                    textTitle: '2hr',
                    paddingVertical: 0,
                    paddingHorizontal: 6,
                  ),
                ],
              ),
            ),
            Container(
              width: 44,
              height: 180,
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
      ),
    );
  }
}
