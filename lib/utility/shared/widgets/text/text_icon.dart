import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class TextIcon extends StatelessWidget {
  final Widget icon;
  final String text;
  const TextIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: darkGreyTextStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
