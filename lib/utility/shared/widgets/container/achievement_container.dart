import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class AchievementContainer extends StatelessWidget {
  const AchievementContainer({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: kGreyColor),
        color: kGreenColor.withOpacity(0.08),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
