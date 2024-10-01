import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class GradientCircleButton extends StatelessWidget {
  const GradientCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
