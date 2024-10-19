import 'package:flutter/material.dart';

import '../shared/constants/constants_ui.dart';

List<Widget> generateCardNumber(String cardNumber) {
  // Create a list of widgets to represent the card number
  List<Widget> widgets = [];

  // Check how many characters are in the card number
  int length = cardNumber.length;

  // Iterate over the four groups
  for (int i = 0; i < 4; i++) {
    if (i < 3) {
      // For the first three parts, show the masked symbol
      widgets.add(
        Text(
          '• • • •',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500, // Adjust this according to your style
          ),
        ),
      );
    } else {
      // For the last part, show the actual numbers
      if (length > i * 4) {
        String part = cardNumber.substring(
            i * 4, length > (i + 1) * 4 ? (i + 1) * 4 : length);
        widgets.add(
          Text(
            part,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight:
                  FontWeight.w500, // Adjust this according to your style
            ),
          ),
        );
      } else {
        // If there's no number to show, add an empty text widget
        widgets.add(
          Text(
            '',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight:
                  FontWeight.w500, // Adjust this according to your style
            ),
          ),
        );
      }
    }
  }

  return widgets;
}
