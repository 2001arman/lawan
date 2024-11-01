import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isBlack;
  final VoidCallback onTap;
  final Color? borderColor, backgroundColor;
  final Color? textColor;
  final Widget? widget;
  final double paddingVertical, paddingHorizontal;
  final double? width;

  const CustomButton({
    super.key,
    this.title = '',
    required this.isBlack,
    required this.onTap,
    this.borderColor,
    this.textColor,
    this.widget,
    this.paddingVertical = 14,
    this.backgroundColor,
    this.paddingHorizontal = 0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: AbsorbPointer(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical, horizontal: paddingHorizontal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1,
              color: isBlack ? Colors.transparent : borderColor ?? kWhiteColor,
            ),
            color:
                isBlack ? kBlackColor : backgroundColor ?? Colors.transparent,
          ),
          child: Center(
            child: widget ??
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    color: textColor ?? (isBlack ? kWhiteColor : kBlackColor),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
