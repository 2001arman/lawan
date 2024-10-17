import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class TextBorder extends StatelessWidget {
  final String textTitle;
  final double fontSize;
  final double paddingVertical, paddingHorizontal;
  final Color? backgroundColor, textColor, borderColor;
  final LinearGradient? gradient;
  const TextBorder({
    super.key,
    required this.textTitle,
    this.fontSize = 12,
    this.paddingVertical = 4,
    this.paddingHorizontal = 12,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.gradient,
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
          color: borderColor ?? kGreyColor,
        ),
      ),
      child: gradient != null
          ? ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => gradient!.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                textTitle,
                style: darkGreyTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: medium,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : Text(
              textTitle,
              style: darkGreyTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: medium,
                color: textColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}
