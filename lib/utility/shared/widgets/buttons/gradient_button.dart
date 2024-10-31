import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;
  final double paddingVertical, paddingHorizontal;
  final List<BoxShadow>? boxShadow;

  const GradientButton({
    super.key,
    required this.onTap,
    required this.widget,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingVertical,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: mainGradient,
          boxShadow: boxShadow,
        ),
        child: Center(child: widget),
      ),
    );
  }
}
