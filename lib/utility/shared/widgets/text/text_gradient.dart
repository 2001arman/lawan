import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';

class TextGradient extends StatelessWidget {
  const TextGradient({
    super.key,
    required this.gradient,
    required this.textTitle,
    required this.fontSize,
    required this.textColor,
  });
  final LinearGradient gradient;
  final String textTitle;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
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
    );
  }
}
