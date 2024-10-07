import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CustomAppbar extends StatelessWidget {
  final bool backEnable;
  final VoidCallback onTap;
  const CustomAppbar({super.key, this.backEnable = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Icon(Icons.keyboard_arrow_down, color: kBlackColor),
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
                  Icon(Icons.keyboard_arrow_down, color: kBlackColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
