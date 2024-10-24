import 'package:flutter/services.dart';

class AlphabeticFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow only alphabetic characters (A-Z, a-z)
    String newText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z]'), '');

    // Return the formatted value with the new valid alphabetic text
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
