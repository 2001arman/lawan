import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants_ui.dart';

class BottomNavbarItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final String icon, title;
  const BottomNavbarItem(
      {super.key,
      required this.onTap,
      required this.isActive,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive ? kBlackColor : kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              // ignore: deprecated_member_use
              color: isActive ? kWhiteColor : kBlackColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: blackTextStyle.copyWith(
                color: isActive ? kWhiteColor : kBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 15.66 / 12,
                letterSpacing: -0.24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
