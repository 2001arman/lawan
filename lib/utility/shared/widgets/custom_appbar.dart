import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants_ui.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool backEnable;
  const CustomAppbar({super.key, this.backEnable = false});

  @override
  Widget build(BuildContext context) {
    return _appBar();
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: kBackgroundColor,
      leading: Row(
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
        ],
      ),
      leadingWidth: Get.width,
      actions: [
        Container(
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
      ],
    );
  }

  @override
  Size get preferredSize => _appBar().preferredSize;
}
