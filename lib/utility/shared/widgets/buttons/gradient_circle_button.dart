import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants_ui.dart';

class GradientCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? widget;
  final double size;
  const GradientCircleButton({
    super.key,
    required this.onTap,
    this.widget,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: mainGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: widget ??
              SvgPicture.asset(
                'assets/icons/plus.svg',
              ),
        ),
      ),
    );
  }
}
