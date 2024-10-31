// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class FieldNumberWidget extends StatelessWidget {
  final Color? iconColor;
  final String court;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;
  final Color? textColor;
  const FieldNumberWidget({
    super.key,
    this.iconColor,
    required this.court,
    this.fontSize = 16,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SvgPicture.asset(
            'assets/icons/arena.svg',
            color: iconColor ?? kMidgreyColor,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              court,
              style: blackTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: medium,
                  color: textColor ?? kBlackColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
