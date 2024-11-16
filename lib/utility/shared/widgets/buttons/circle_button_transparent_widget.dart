import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CircleButtonTransparentWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;
  final EdgeInsets? margin;
  final Color? borderColor, backgroundColor;
  final double size;
  const CircleButtonTransparentWidget({
    super.key,
    required this.onTap,
    required this.widget,
    this.margin,
    this.borderColor,
    this.size = 48,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        margin: margin,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? Colors.transparent,
          border: Border.all(
            width: 1,
            color: borderColor ?? kWhiteColor,
          ),
        ),
        child: Center(child: widget),
      ),
    );
  }
}
