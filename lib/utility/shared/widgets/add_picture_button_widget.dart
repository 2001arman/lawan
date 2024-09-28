import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class AddPictureButtonWidget extends StatelessWidget {
  final double margin;
  final VoidCallback onTap;
  const AddPictureButtonWidget(
      {super.key, this.margin = 12, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 120,
        margin: EdgeInsets.symmetric(vertical: margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/picture.png', width: 24, height: 24),
            const SizedBox(height: 8),
            Text(
              'Add Picture',
              style: midGreyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
