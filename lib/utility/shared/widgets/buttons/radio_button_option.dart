// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants_ui.dart';

class RadioButtonOption extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String value;
  final RxString groupValue;
  const RadioButtonOption({
    super.key,
    required this.title,
    this.subTitle,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: darkGreyTextStyle.copyWith(fontSize: 12),
                  ),
              ],
            ),
          ),
          Transform.scale(
            scale: 1.8,
            child: Radio(
              value: value,
              groupValue: groupValue.value,
              onChanged: (newVal) {
                groupValue.value = value;
              },
              activeColor: kGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
