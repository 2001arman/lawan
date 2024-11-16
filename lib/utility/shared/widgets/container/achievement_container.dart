import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class AchievementContainer extends StatelessWidget {
  const AchievementContainer({
    super.key,
    required this.icon,
    this.size = 40,
    this.isSelected = false,
  });
  final String icon;
  final double size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: kGreyColor),
              color: kGreenColor.withOpacity(0.08),
            ),
            child: SvgPicture.asset(icon),
          ),
          if (isSelected)
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'assets/icons/check-circle.svg',
                width: 16,
                height: 16,
              ),
            )
        ],
      ),
    );
  }
}
