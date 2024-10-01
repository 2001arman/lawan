// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class FieldNumberWidget extends StatelessWidget {
  final Color? iconColor;
  const FieldNumberWidget({super.key, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/arena.svg',
          color: iconColor ?? kMidgreyColor,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 8),
        Text(
          '1',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
