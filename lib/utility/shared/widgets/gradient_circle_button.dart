import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class GradientCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  const GradientCircleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: mainGradient,
        ),
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
