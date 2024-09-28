import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final Widget? widget;
  final EdgeInsets? margin;
  const CircleButtonWidget(
      {super.key,
      required this.onTap,
      this.widget,
      this.isActive = true,
      this.margin});

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
