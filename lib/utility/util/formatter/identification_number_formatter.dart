import 'package:flutter/services.dart';

class IdentificationNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any existing '-' characters
    String newText = newValue.text.replaceAll('-', '');

    // Handle backspace
    if (newText.length < oldValue.text.length) {
      return newValue;
    }

    // Add '-' characters at appropriate positions
    if (newText.length > 6 && newText.length <= 8) {
      newText = '${newText.substring(0, 6)}-${newText.substring(6)}';
    } else if (newText.length > 8) {
      newText =
          '${newText.substring(0, 6)}-${newText.substring(6, 8)}-${newText.substring(8)}';
    }

    if (newText.length == 14) {
      return newValue;
    }

    // Return the formatted value
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
