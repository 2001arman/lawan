import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class TextBoder extends StatelessWidget {
  final String textTitle;
  final double fontSize;
  final double paddingVertical, paddingHorizontal;
  final Color? backgroundColor;
  const TextBoder({
    super.key,
    required this.textTitle,
    this.fontSize = 12,
    this.paddingVertical = 4,
    this.paddingHorizontal = 12,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: kGreyColor,
        ),
      ),
      child: Text(
        textTitle,
        style: darkGreyTextStyle.copyWith(
          fontSize: fontSize,
          fontWeight: medium,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
