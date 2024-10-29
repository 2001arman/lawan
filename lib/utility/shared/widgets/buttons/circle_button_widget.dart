import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final Widget? widget;
  final EdgeInsets? margin;
  final Color? borderColor;
  final double size;
  final bool dynamicWidth;
  const CircleButtonWidget({
    super.key,
    required this.onTap,
    this.widget,
    this.isActive = true,
    this.margin,
    this.borderColor,
    this.size = 44,
    this.dynamicWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dynamicWidth == true ? null : size,
        height: size,
        margin: margin,
        constraints: BoxConstraints(maxHeight: size, minWidth: size),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? kBlackColor : kWhiteColor,
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: widget ??
            Icon(
              Icons.add,
              color: kWhiteColor,
            ),
      ),
    );
  }
}
