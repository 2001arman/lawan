import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class TextPillWidget extends StatelessWidget {
  final String data;
  const TextPillWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kGreenColor),
      child: Text(
        data,
        style: whiteTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
      ),
    );
  }
}
