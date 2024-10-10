import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';

class TextPillWidget extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final Color? backgroundColor;
  final double verticalPadding, horizontalPadding;
  final Color? titleColor;
  const TextPillWidget({
    super.key,
    required this.title,
    this.prefix,
    this.backgroundColor,
    this.verticalPadding = 4,
    this.horizontalPadding = 8,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor ?? kGreenColor),
      child: Row(
        children: [
          prefix ?? const SizedBox(),
          Text(
            title,
            style: whiteTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
                color: titleColor ?? kWhiteColor),
          ),
        ],
      ),
    );
  }
}
