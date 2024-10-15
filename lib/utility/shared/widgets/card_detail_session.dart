import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants_ui.dart';
import 'text/text_border.dart';

class CardDetailSession extends StatelessWidget {
  final String title;
  final String icon;
  final String contentText;
  final double fontSize;
  final String? description;
  const CardDetailSession(
      {super.key,
      required this.title,
      required this.icon,
      required this.contentText,
      required this.fontSize,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 98,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: kGreyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  // ignore: deprecated_member_use
                  color: kDarkgreyColor,
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              contentText,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: fontSize,
              ),
              overflow: description != null
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextBorder(
                  textTitle: description!,
                  fontSize: 11,
                  paddingVertical: 0,
                  paddingHorizontal: 6,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
