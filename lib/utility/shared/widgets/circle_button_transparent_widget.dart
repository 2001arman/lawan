import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CircleButtonTransparentWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;
  final EdgeInsets? margin;
  const CircleButtonTransparentWidget(
      {super.key, required this.onTap, required this.widget, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        margin: margin,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: kWhiteColor,
          ),
        ),
        child: widget,
      ),
    );
  }
}
