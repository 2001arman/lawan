import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';

class HorizontalWhiteGradient extends StatelessWidget {
  final double height;
  const HorizontalWhiteGradient({super.key, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kBackgroundColor,
            kBackgroundColor.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
