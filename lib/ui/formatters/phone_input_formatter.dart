import 'package:flutter/services.dart';


class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.start;

    final StringBuffer newText = new StringBuffer();
    newText.write(newValue.text);

    // if adding values to the input field
    if (newValue.text.length >= oldValue.text.length) {
      // when the new value length is 3 (add a -)
      if (newTextLength == 3 || newTextLength == 7) {
        newText.write('-');
        selectionIndex += 1;
      }
    }

    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
