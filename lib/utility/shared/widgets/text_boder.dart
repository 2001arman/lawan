import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class TextBoder extends StatelessWidget {
  final String textTitle;
  final double fontSize;
  final double paddingVertical, paddingHorizontal;
  const TextBoder({
    super.key,
    required this.textTitle,
    this.fontSize = 12,
    this.paddingVertical = 4,
    this.paddingHorizontal = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
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
      ),
    );
  }
}
