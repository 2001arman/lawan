import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;

  const GradientButton({
    super.key,
    required this.onTap,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), gradient: mainGradient),
        child: Center(child: widget),
      ),
    );
  }
}
