import 'package:flutter/material.dart';

import '../../constants/constants_ui.dart';

class HorizontalWhiteGradient extends StatelessWidget {
  const HorizontalWhiteGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 24,
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
