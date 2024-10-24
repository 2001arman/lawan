import 'package:flutter/services.dart';

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any existing '/' characters
    String newText = newValue.text.replaceAll('/', '');

    // Handle backspace
    if (newText.length < oldValue.text.length) {
      return newValue;
    }

    // Add '/' character after the first two digits
    if (newText.length > 2) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    // Limit the input to 4 digits (xx/xx format)
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    // Return the formatted value
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
