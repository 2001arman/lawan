import 'package:flutter/cupertino.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class HorizontalBlackGradient extends StatelessWidget {
  final bool bottomToTop;
  final double height;
  const HorizontalBlackGradient({
    super.key,
    this.bottomToTop = true,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: bottomToTop ? shadowGradient : shadowGradientTopBottom,
      ),
    );
  }
}
