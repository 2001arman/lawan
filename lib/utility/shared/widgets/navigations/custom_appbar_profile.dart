import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants_ui.dart';

class CustomAppbarProfile extends StatelessWidget {
  final bool backEnable;
  final VoidCallback onTap;
  const CustomAppbarProfile({
    super.key,
    this.backEnable = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            margin: const EdgeInsets.only(left: 16, top: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kWhiteColor,
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/ball.png', width: 32),
                const SizedBox(width: 6),
                Text(
                  'Soccer',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset('assets/icons/chevron-down.svg'),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: const EdgeInsets.only(right: 16, top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/image_person.png',
                      width: 32, fit: BoxFit.cover),
                  const SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/chevron-down.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
