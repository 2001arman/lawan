// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

import '../buttons/circle_button_transparent_widget.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.iconColor,
    required this.borderColor,
    required this.textColor,
    this.onTap,
    this.icon = 'assets/icons/back.svg',
  });
  final String title, icon;
  final Color iconColor, borderColor, textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButtonTransparentWidget(
          onTap: onTap ?? Get.back,
          widget: SvgPicture.asset(
            icon,
            color: iconColor,
          ),
          margin: EdgeInsets.only(right: defaultMargin),
          borderColor: borderColor,
        ),
        Text(
          title,
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: medium, color: textColor),
        ),
      ],
    );
  }
}
