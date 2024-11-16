import 'package:flutter/cupertino.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class HorizontalBlackGradient extends StatelessWidget {
  const HorizontalBlackGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: shadowGradient,
      ),
    );
  }
}
