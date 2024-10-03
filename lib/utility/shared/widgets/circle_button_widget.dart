import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final Widget? widget;
  final EdgeInsets? margin;
  final Color? borderColor;
  const CircleButtonWidget({
    super.key,
    required this.onTap,
    this.widget,
    this.isActive = true,
    this.margin,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        margin: margin,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
