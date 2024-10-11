import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';
import '../text/text_border.dart';

class SelectFriendItem extends StatelessWidget {
  final String name, asset;
  final Widget suffixWidget;
  const SelectFriendItem(
      {super.key,
      required this.name,
      required this.asset,
      required this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 1, color: kGreyColor),
      ),
      child: Row(
        children: [
          Image.asset(asset, width: 32),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                  ),
                ),
                TextBorder(
                  textTitle: 'Novice',
                  backgroundColor: kWhiteColor,
                  fontSize: 10,
                )
              ],
            ),
          ),
          suffixWidget,
        ],
      ),
    );
  }
}
